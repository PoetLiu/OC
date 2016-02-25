//
//  main.m
//  05.01 CarParts
//
//  Created by liupeng on 16/2/25.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject
@end
@implementation Tire
- (NSString *) description
{
	return (@"I am a tire. I last a while.");
}
@end

@interface Engine : NSObject
@end
@implementation Engine
- (NSString *) description
{
	return (@"I am an engine. Vrooom!");
}
@end

@interface Car : NSObject
{
	Engine *engine;
	Tire *tires[4];
}
- (void) print;
@end
@implementation Car
- (id) init
{
	if (self = [super init]) {
		engine	= [Engine new];
		tires[0]	= [Tire new];
		tires[1]	= [Tire new];
		tires[2]	= [Tire new];
		tires[3]	= [Tire new];
	}
	return (self);
}
@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
	    NSLog(@"Hello, World!");
	}
    return 0;
}
