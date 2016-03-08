//
//  main.m
//  09.02 RetainCount-2
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
	NSAutoreleasePool *pool;
	pool	= [[NSAutoreleasePool alloc] init];
	
	RetainTracker *tracker;
	tracker	= [RetainTracker new];	// count:1
	
	[tracker retain]; // count:2
	[tracker autorelease]; // count:still 2
	[tracker release]; // count:1
	
	NSLog(@"releasing pool");
	[pool release];
	// get nuked, sends release to tracker.
	
	@autoreleasepool {
		RetainTracker *tracker2;
		tracker2	= [RetainTracker new]; // count:1
		[tracker2 retain]; // count:2
		[tracker2 autorelease]; // count: still 2
		[tracker2 release]; // count:1
		
	    NSLog(@"auto releasing pool");
	}
    return 0;
}
