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
	NSString *make;
	NSString *model;
	int modelYear;
	int numberOfDoors;
	float mileage;
}
@property (readwrite, copy) NSString *name;
@property (readwrite, retain) Engine *engine;
@property (readwrite, copy) NSString *make;
@property (readwrite, copy) NSString *model;
@property (readwrite) int modelYear;
@property (readwrite) int numberOfDoors;
@property (readwrite) float mileage;
- (Tire *) tireAtIndex: (int) index;
- (void) setTire: (Tire *) tire atIndex: (int) index;
- (void) print;
@end
