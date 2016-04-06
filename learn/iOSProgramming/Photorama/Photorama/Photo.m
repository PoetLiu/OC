//
//  Photo.m
//  Photorama
//
//  Created by liupeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Photo.h"

@implementation Photo
- (instancetype)initWithTitle:(NSString *)title photoID:(NSString *)id remoteURL:(NSURL*)url dateTaken:(NSDate *)date
{
	if (self = [super init]) {
		self.title		= title;
		self.photoID	= id;
		self.remoteURL	= url;
		self.dateTaken	= date;
	}
	return self;
}

-(instancetype)init {
	if (self = [self initWithTitle:nil photoID:nil remoteURL:nil dateTaken:nil]) {
		
	}
	return self;
}
@end
