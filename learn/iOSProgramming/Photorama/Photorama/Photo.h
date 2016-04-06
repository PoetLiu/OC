//
//  Photo.h
//  Photorama
//
//  Created by liupeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Photo : NSObject
@property NSString *title;
@property NSURL *remoteURL;
@property NSString *photoID;
@property NSDate *dateTaken;
@property UIImage *image;
- (instancetype)initWithTitle:(NSString *)title photoID:(NSString *)id remoteURL:(NSURL*)url dateTaken:(NSDate *)date;
@end
