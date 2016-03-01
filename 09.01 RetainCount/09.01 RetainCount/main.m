//
//  main.m
//  09.01 RetainCount
//
//  Created by liupeng on 16/2/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RetainTracker : NSObject
@end
@implementation RetainTracker
- (id) init
{
	if (self = [super init]) {
		NSLog(@"init: Retain count of %lu", [self retainCount]);
	}
	return self;
}
- (void) dealloc
{
	NSLog(@"dealloc called. Bye Bye.");
	[super dealloc];
}
@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		RetainTracker *tracker	= [RetainTracker new];
		// count:1
		
		[tracker retain]; // count:2
		NSLog(@"%lu", [tracker retainCount]);
		
		[tracker retain]; // count:3
		NSLog(@"%lu", [tracker retainCount]);
		
		[tracker release]; // count:2
		NSLog(@"%lu", [tracker retainCount]);
		
		[tracker release]; // count:1
		NSLog(@"%lu", [tracker retainCount]);
		
		[tracker retain]; // count:2
		NSLog(@"%lu", [tracker retainCount]);
		
		[tracker release]; // count:1
		NSLog(@"%lu", [tracker retainCount]);
		
		[tracker release]; // count:0, dealloc it.
	}
    return 0;
}
