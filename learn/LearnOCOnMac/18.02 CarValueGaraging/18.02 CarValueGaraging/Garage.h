//
//  Garage.h
//  18.02 CarValueGaraging
//
//  Created by liupeng on 16/3/8.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Car;
@interface Garage : NSObject
{
	NSString *name;
	NSMutableArray *cars;
}
@property (readwrite, copy) NSString *name;
- (void) addCar: (Car *) car;
- (void) print;
@end
