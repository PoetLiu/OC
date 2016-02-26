//
//  main.m
//  05.02 CarParts-Accessors
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

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
- (Engine *) engine;
- (void) setEngine: (Engine *) newEngine;
- (Tire *) tireAtIndex: (int) index;
- (void) setTire: (Tire *) tire atIndex: (int) index;
- (void) print;
@end
@implementation Car
- (Engine *) engine
{
	return (engine);
}
- (void) setEngine:(Engine *)newEngine
{
	engine	= newEngine;
}
- (void) setTire:(Tire *)tire atIndex:(int)index
{
	if (index < 0 || index > 3) {
		NSLog(@"bad index(%d) in tireAtIndex:", index);
		exit(1);
	}
	tires[index]	= tire;
}
- (Tire *) tireAtIndex:(int)index
{
	if (index < 0 || index > 3) {
		NSLog(@"bad index (%d) in tireAtIndex:", index);
		exit(1);
	}
	return (tires[index]);
}
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
- (void) print
{
	NSLog(@"%@", engine);
	NSLog(@"%@", tires[0]);
	NSLog(@"%@", tires[1]);
	NSLog(@"%@", tires[2]);
	NSLog(@"%@", tires[3]);
}
@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Car *car = [Car new];
		Engine *engine	= [Engine new];
		[car setEngine: engine];
		
		for (int i = 0; i < 4; i++) {
			Tire *tire	= [Tire new];
			[car setTire:tire atIndex:i];
		}
		[car print];
	}
	return 0;
}
