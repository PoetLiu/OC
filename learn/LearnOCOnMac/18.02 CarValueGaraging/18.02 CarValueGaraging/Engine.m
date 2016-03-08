//
//  Engine.m
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Engine.h"

@implementation Engine
- (id) init
{
	if (self = [super init]) {
		horsepower	= 145;
	}
	return (self);
}
- (NSString *) description
{
	return [NSString stringWithFormat:@"I am an engine, horsepower:%d. Vrooom!", horsepower];
}	// description
- (id) copyWithZone:(NSZone *)zone
{
	Engine *engineCopy;
	engineCopy = [[[self class] allocWithZone:zone] init];
	engineCopy->horsepower	= horsepower;
	return (engineCopy);
}
@end // Engine
