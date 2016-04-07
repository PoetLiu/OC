//
//  FlickrAPI.h
//  Photorama
//
//  Created by liupeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photo.h"
#import <CoreData/CoreData.h>

@interface FlickrAPI : NSObject
@property NSDictionary *method;
-(NSURL *) recentPhotosURL;
- (NSMutableArray *) photosFromJSONData:(NSData *)data inContext:(NSManagedObjectContext *)context;
@end
