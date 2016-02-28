//
//  main.m
//  08.05 NSDictionary
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
    return @"I am a tire.";
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Tire *t1    = [Tire new];
        Tire *t2    = [Tire new];
        Tire *t3    = [Tire new];
        Tire *t4    = [Tire new];
        
        NSArray *a1 = @[@"front-left", @"front-right", @"back-left", @"back-right"];
        
        NSDictionary *tires = [NSDictionary dictionaryWithObjectsAndKeys: t1, a1[0],
                               t2, a1[1], t3, a1[2], t4, a1[3], nil];
        NSDictionary *tires1 = @{a1[0]:t1, a1[1]:t2, a1[2]:t3, a1[3]:t4};
        NSLog(@"%@", tires);
        
        for (NSString *key in a1) {
            NSLog(@"key:%@, content:%@", key, tires[key]);
        }
        
        for (NSString *key in a1) {
            NSLog(@"key:%@, content:%@", key, [tires1 objectForKey:key]);
        }
    }
    return 0;
}
