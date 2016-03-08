//
//  NumberConvenience.m
//  12.01 Category
//
//  Created by liupeng on 16/3/2.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "NumberConvenience.h"

@implementation NSString (NumberConvenience)
- (NSNumber *) lengthAsNumber
{
	NSUInteger length	= [self length];
	return ([NSNumber numberWithUnsignedInteger:length]);
}
@end // NumberConvenience
