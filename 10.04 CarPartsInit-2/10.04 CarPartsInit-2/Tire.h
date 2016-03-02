//
//  Tire.h
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Tire : NSObject
{
    float pressure;
    float treadDepth;
}
- (id) initWithPressure: (float) pressure treadDepth: (float) treadDepth;
- (id) initWithPressure: (float) pressure;
- (id) initWithTreadDepth: (float) treadDepth;
- (void) setPressure:(float) pressure;
- (float) pressure;
- (void) setTreadDepth:(float) treadDepth;
- (float) treadDepth;
@end // Tire
