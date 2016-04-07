//
//  Photo.m
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Photo.h"

@implementation Photo
@synthesize image;

// Insert code here to add functionality to your managed object subclass
-(void)awakeFromInsert {
	[super awakeFromInsert];
	self.title = @"";
	self.photoID = @"";
	self.remoteURL = [[NSURL alloc] init];
	self.photoKey	= [[NSUUID UUID] UUIDString];
	self.dateTaken	= [[NSDate alloc] init];
}
@end
