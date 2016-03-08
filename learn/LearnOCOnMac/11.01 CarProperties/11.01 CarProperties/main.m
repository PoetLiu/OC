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
			NSLog(@"tire %d's handling is %.f %.f", i, [tire rainHandling], [tire snowHandling]);
			[car setTire:tire atIndex:i];
            [tire release];
		}
		Engine *engine	= [[Slant6 new] init];
		[car setEngine: engine];
		[car print];
        [car release];
	}
	return 0;
}
