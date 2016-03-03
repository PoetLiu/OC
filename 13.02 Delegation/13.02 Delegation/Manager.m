//
//  Manager.m
//  13.02 Delegation
//
//  Created by liupeng on 16/3/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Manager.h"

@implementation Manager
@synthesize delegate;
- (void) doWork
{
	[delegate doSomeRequiredWork];
	if (YES == [delegate respondsToSelector:@selector(doSomeOptionalWork)]) {
		[delegate doSomeOptionalWork];
	}
	[self myWork];
}

- (void) myWork
{
	NSLog(@"I am a manager and I am Working");
}
@end
