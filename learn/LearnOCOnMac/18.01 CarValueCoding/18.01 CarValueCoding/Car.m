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
@synthesize name;
@synthesize engine;
@synthesize make;
@synthesize model;
@synthesize modelYear;
@synthesize numberOfDoors;
@synthesize mileage;

- (id) copyWithZone:(NSZone *)zone
{
	Car *carCopy;
	carCopy	= [[[self class] allocWithZone:zone] init];
	carCopy.name	= self.name;
	carCopy.make	= make;
	carCopy.model 	= model;
	carCopy.modelYear= modelYear;
	carCopy.numberOfDoors	= numberOfDoors;
	carCopy.mileage	= mileage;
	Engine *engineCopy;
	engineCopy	= [[engine copy] autorelease];
	carCopy.engine	= engineCopy;
	
	for (int i = 0; i < 4; i++) {
		Tire *tireCopy;
		tireCopy	= [[self tireAtIndex:i] copy];
		[tireCopy autorelease];
		[carCopy setTire:tireCopy atIndex:i];
	}
	return (carCopy);
}

- (id) init
{
    if (self = [super init]) {
		name	= @"Car";
        tires   = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            [tires addObject:[NSNull null]];
        }
    }
    return (self);
} // init

- (void) setTire:(Tire *)tire atIndex:(int)index
{
    [tires replaceObjectAtIndex: index withObject:tire];
}

- (Tire *) tireAtIndex:(int)index
{
    Tire *tire;
    tire    = [tires objectAtIndex:index];
    return (tire);
} // tireAtIndex

- (void) print
{
	NSLog(@"%@ has:", name);
    for (int i = 0; i < 4; i++) {
        NSLog(@"%@", [self tireAtIndex:i]);
    }
    NSLog(@"%@", engine);
}

- (NSString *)description
{
	NSString *desc;
	desc	= [NSString stringWithFormat:@"%@, a %d %@ %@, has %d doors, %.1f miles, and %lu tires.", name, modelYear,
			   make, model, numberOfDoors, mileage, (unsigned long)[tires count]];
	return (desc);
}

- (void) dealloc
{
	[name release];
    [tires release];
    [engine release];
    [super dealloc];
} // dealloc
@end // Car

