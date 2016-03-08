//
//  main.m
//  08.05 NSMutableDictionary
//
//  Created by liuPeng on 16/2/28.
//  Copyright © 2016年 liuPeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject
@end
@implementation Tire
- (NSString *) description
{
    return @"I am a tire";
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Tire *t1 = [Tire new];
        Tire *t2 = [Tire new];
        Tire *t3 = [Tire new];
        Tire *t4 = [Tire new];
        
        NSArray *tireKeys = @[@"front-left", @"front-right", @"back-left", @"back-rigth"];
        /* Add item to NSMutableDictionary. */
        NSMutableDictionary *tires  = [NSMutableDictionary dictionary];
        [tires setObject:t1 forKey:tireKeys[0]];
        [tires setObject:t2 forKey:tireKeys[1]];
        [tires setObject:t3 forKey:tireKeys[2]];
        [tires setObject:t4 forKey:tireKeys[3]];
        NSLog(@"tires:%@", tires);
        
        /* Del item from NSMutableDictionary. */
        [tires removeObjectForKey:tireKeys[1]];
        NSLog(@"tires:%@", tires);
        
    }
    return 0;
}
