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
- (id) init
{
    if (self = [super init]) {
		name	= [[NSString alloc] initWithString:@"Car"];
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

- (void) dealloc
{
	[name release];
    [tires release];
    [engine release];
    [super dealloc];
} // dealloc
@end // Car

