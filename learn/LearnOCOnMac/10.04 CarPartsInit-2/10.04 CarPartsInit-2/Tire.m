//
//  Tire.m
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (id) initWithPressure: (float)p treadDepth: (float)td
{
	if (self = [super init]) {
		pressure	= p;
		treadDepth	= td;
	}
	return (self);
}

- (id) init
{
    if (self = [self initWithPressure:34 treadDepth:20]) {
    }
    return (self);
} // init

- (id) initWithPressure: (float)p
{
	if (self = [self initWithPressure:pressure treadDepth:20.0]) {
	}
	return (self);
}

- (id) initWithTreadDepth: (float)td
{
	if (self = [self initWithPressure:34.0 treadDepth:td]) {
	}
	return (self);
}

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
