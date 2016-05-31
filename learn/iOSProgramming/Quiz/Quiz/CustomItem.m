//
//  CustomItem.m
//  Quiz
//
//  Created by liupeng on 16/3/21.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CustomItem.h"

@interface CustomItem ()

@end

@implementation CustomItem

- (id) initWithQuestion:(NSString *)question answer:(NSString *)answer {
	if (self = [super init]) {
		_question	= [question copy];
		_answer		= [answer copy];
	}
	return (self);
}
@end
