//
//  Car.h
//  06.01 CarParts-Split
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Tire;
@class Engine;

@interface Car : NSObject <NSCopying>
{
	NSString *name;
    NSMutableArray *tires;
    Engine *engine;
}
@property (copy) NSString *name;
@property (retain) Engine *engine;
- (Tire *) tireAtIndex: (int) index;
- (void) setTire: (Tire *) tire atIndex: (int) index;
- (void) print;
@end
