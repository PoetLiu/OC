//
//  main.m
//  05.03 CarParts-2
//
//  Created by liupeng on 16/2/26.
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
@end // Tire

@interface Engine : NSObject
@end
@implementation Engine
- (NSString *) description
{
	return (@"I am an engine. Vrooom!");
}
@end // Engine

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
@end // Car

@interface Slant6 : Engine
@end
@implementation Slant6
- (NSString *)description
{
	return (@"I am a slant-6. VROO0M!");
} // description
@end // Slant6

@interface AllWeatherRadial : Tire
@end // AllWeatherRadial
@implementation AllWeatherRadial
- (NSString *) description
{
	return (@"I am a tire for rain or shine.");
} // description
@end

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Car *car = [Car new];
		for (int i = 0; i < 4; i++) {
			Tire *tire	= [AllWeatherRadial new];
			[car setTire:tire atIndex:i];
		}
		Engine *engine	= [Slant6 new];
		[car setEngine: engine];
		[car print];
	}
	return 0;
}
