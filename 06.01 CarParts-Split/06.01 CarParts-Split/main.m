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
