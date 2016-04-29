//
//  ImageStore.m
//  Homepwner
//
//  Created by liupeng on 16/3/30.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ImageStore.h"

@implementation ImageStore
- (id) init {
	if (self = [super init]) {
		self.cache	= [[NSCache alloc] init];
	}
	return self;
}

- (void) setImage:(UIImage *)image forKey:(NSString *)key {
	[self.cache setObject:image forKey:key];
	NSURL *imageURL	= [self imageURLForKey:key];
	NSData *data	= UIImagePNGRepresentation(image);
	[data writeToURL:imageURL atomically:true];

}

- (UIImage *) imageForKey:(NSString *)key {
	UIImage *image	= [self.cache objectForKey:key];
	if (image) {
		return image;
	}
	
	NSURL *imageURL	= [self imageURLForKey:key];
	image	= [UIImage imageWithContentsOfFile:imageURL.path];
	if (image) {
		[self.cache setObject:image forKey:key];
	}

	return image;
}

- (void) deleteImageForKey:(NSString *)key {
	[self.cache removeObjectForKey:key];
	NSURL *imageURL = [self imageURLForKey:key];
	NSError *error;
	[[NSFileManager defaultManager] removeItemAtURL:imageURL error:&error];
	if (error) {
		NSLog(@"Error removing the image from disk:%@", error);
	}
}

- (NSURL *)imageURLForKey:(NSString *)key {
	NSArray *documentsDirectories = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
	return [[documentsDirectories firstObject] URLByAppendingPathComponent:key];
}
@end
