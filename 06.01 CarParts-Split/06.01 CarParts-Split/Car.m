//
//  Car.m
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Car.h"
#import "Tire.h"
#import "Engine.h"
@implementation Car
{
	Tire *tires[4];
	Engine *engine;
}
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

