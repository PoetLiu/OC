//
//  Engine.m
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Engine.h"

@implementation Engine
- (NSString *) description
{
	return (@"I am an engine. Vrooom!");
}	// description
- (id) copyWithZone:(NSZone *)zone
{
	Engine *engineCopy;
	engineCopy = [[[self class] allocWithZone:zone] init];
	return (engineCopy);
}
@end // Engine
