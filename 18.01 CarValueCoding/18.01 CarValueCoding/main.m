//
//  main.m
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Car.h"
#import "AllWeatherRadial.h"
#import "Slant6.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Car *car = [[Car alloc] init];
		car.name	= @"Herbie";
		car.make	= @"Honda";
		car.model	= @"CRX";
		car.numberOfDoors	= 2;
		car.modelYear	= 1984;
		car.mileage	= 110000;
		for (int i = 0; i < 4; i++) {
			AllWeatherRadial *tire	= [[AllWeatherRadial alloc] init];
			[tire setRainHandling:20+i];
			[tire setSnowHandling:28+i];
			[car setTire:tire atIndex:i];
            [tire release];
		}
		Slant6 *engine	= [[[Slant6 alloc] init] autorelease];
		car.engine	= engine;
		NSLog(@"Car is %@", car);
		NSLog(@"horsepower is %@", [engine valueForKey:@"horsepower"]);
		[engine setValue:[NSNumber numberWithInt:150] forKey:@"horsepower"];
		NSLog(@"horsepower is %@", [engine valueForKey:@"horsepower"]);
		[car setValue:[NSNumber numberWithInt:155] forKeyPath:@"engine.horsepower"];
		NSLog(@"horsepower is %@", [car valueForKeyPath:@"engine.horsepower"]);
	}
	return 0;
}
