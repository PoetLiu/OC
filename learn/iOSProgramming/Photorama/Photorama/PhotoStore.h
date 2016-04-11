//
//  PhotoStore.h
//  Photorama
//
//  Created by liupeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "FlickrAPI.h"
#import "CoreDataStack.h"

@interface PhotoStore : NSObject <NSURLSessionDataDelegate>
@property NSURLSession *session;
@property FlickrAPI *flickrAPI;
@property CoreDataStack *coreDataStack;
-(void) fetchRecentPhotos:(void (^)(NSMutableArray *photos))completion;
-(void) fetchImageForPhoto:(Photo *)photo completion:(void (^)(UIImage *image))completion;
@end
