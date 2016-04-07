//
//  PhotoStore.m
//  Photorama
//
//  Created by liupeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "PhotoStore.h"

@implementation PhotoStore
-(instancetype)init {
	if (self = [super init]) {
		self.session	= [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
		self.flickrAPI	= [[FlickrAPI alloc] init];
		self.coreDataStack	= [[CoreDataStack alloc] initWithModelName:@"Photorama"];
	}
	return self;
}

- (void) fetchRecentPhotos:(void (^)(NSMutableArray *photos))completion {
	NSURL *url = [self.flickrAPI recentPhotosURL];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"Error fetching recent photos:%@", error);
			return;
		}
		NSMutableArray *result = [self processRecentPhotosRequest:data error:nil];
		completion(result);
	}];
	[task resume];
}

/*
 * 由于69.147.76.173服务器SSL(https)通信时，无法验证证书有效性, 提示：
 	Error Domain=NSURLErrorDomain Code=-1202 "The certificate for this server is
   invalid. You might be connecting to a server that is pretending to be “69.147.76.173” which could put your confidential information at risk."所
 以必须手动在这里放行，但如果实现了这个功能，那么所有https请求，都需要自己手动验证(比如这里的farm2.staticflickr.com)。否则不需要。
 */
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential *))completionHandler{
	if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
		//NSLog(@"challenge:%@", challenge.protectionSpace.host);
		if([challenge.protectionSpace.host isEqualToString:@"69.147.76.173"] ||
		   [challenge.protectionSpace.host isEqualToString:@"farm2.staticflickr.com"]){
			NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
			completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
		}
	}
}

-(NSMutableArray *) processRecentPhotosRequest:(NSData *)data error:(NSError *) error{
	if (!data) {
		return nil;
	}
	return [self.flickrAPI photosFromJSONData:data inContext:self.coreDataStack.mainQueueContext];
}

-(void) fetchImageForPhoto:(Photo *)photo completion:(void (^)(UIImage *image))completion {
    if (photo.image) {
        completion(photo.image);
        return;
    }
    
	NSURLRequest *request = [NSURLRequest requestWithURL:photo.remoteURL];
	NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request  completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		if (error) {
			NSLog(@"download image faild:%@", error);
			return;
		}
		
		NSLog(@"download image success");
		id result = [self processImageRequest:data];
		if (result) {
			photo.image	= result;
		}
		completion(result);
	}];
	[task resume];
}

- (UIImage *) processImageRequest:(NSData *)data {
	UIImage *image = [UIImage imageWithData:data];
	if (!image) {
		NSLog(@"Couldn't create an image");
		return nil;
	}
	return image;
}
@end
