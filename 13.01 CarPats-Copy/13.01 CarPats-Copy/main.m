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
		[car setName:@"Herbie"];
		for (int i = 0; i < 4; i++) {
			AllWeatherRadial *tire	= [[AllWeatherRadial alloc] init];
			[tire setRainHandling:20+i];
			[tire setSnowHandling:28+i];
			[car setTire:tire atIndex:i];
            [tire release];
		}
		Engine *engine	= [[Slant6 alloc] init];
		[car setEngine: engine];
		[engine release];
		[car print];
		Car *carCopy = [car copy];
		[carCopy print];
        [car release];
		[carCopy release];
	}
	return 0;
}
