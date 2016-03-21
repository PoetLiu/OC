//
//  CustomItem.m
//  Quiz
//
//  Created by liupeng on 16/3/21.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CustomItem.h"

@implementation CustomItem
- (id) initWithQuestion:(NSString *)ques answer:(NSString *)ans {
	if (self = [super init]) {
		self.question	= ques;
		self.answer		= ans;
	}
	return (self);
}
@end
