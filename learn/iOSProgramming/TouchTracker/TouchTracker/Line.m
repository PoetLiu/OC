//
//  Line.m
//  TouchTracker
//
//  Created by liupeng on 16/3/31.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Line.h"

@implementation Line
- (id) initWithBegin:(CGPoint)begin end:(CGPoint)end {
	if (self = [super init]) {
		self.begin	= begin;
		self.end	= end;
	}
	return self;
}

@end
