//
//  Tire.m
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Tire.h"

@implementation Tire
- (id) init
{
    if (self = [super init]) {
        pressure    = 34.9;
        treadDepth  = 20.0;
    }
    return (self);
} // init

- (void) setPressure:(float)p
{
    pressure    = p;
} // setPressure

- (float) pressure
{
    return (pressure);
} // pressure

- (void) setTreadDepth:(float)td
{
    treadDepth  = td;
}// setTreadDepth

- (float) treadDepth
{
    return (treadDepth);
}// treadDepth

- (NSString *) description
{
    NSString *desc;
    desc    = [NSString stringWithFormat:@"Tire: Pressure:%.1f, TreadDepth:%.1f", pressure, treadDepth];
    return (desc);
} // description

@end // Tire
