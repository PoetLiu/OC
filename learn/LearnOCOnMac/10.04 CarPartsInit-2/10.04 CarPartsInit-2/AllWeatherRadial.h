//
//  AllWeatherRadial.h
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Tire.h"

@interface AllWeatherRadial : Tire
{
	float rainHandling;
	float snowHandling;
}
- (void) setRainHandling: (float)rainHandling;
- (float) rainHandling;
- (void) setSnowHandling: (float)snowHandling;
- (float) snowHandling;
@end
