//
//  Garage.m
//  18.02 CarValueGaraging
//
//  Created by liupeng on 16/3/8.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Garage.h"

@implementation Garage
@synthesize name;
 - (void) addCar:(Car *)car
{
	if (cars == nil) {
		cars	= [[NSMutableArray alloc] init];
	}
	[cars addObject:car];
}

- (void) dealloc
{
	[name release];
	[cars release];
	[super dealloc];
}

- (void) print
{
	NSLog(@"%@", name);
	for (Car *car in cars) {
		NSLog(@" %@", car);
	}
}
@end
