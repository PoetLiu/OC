//
//  main.m
//  08.05 FastEnum
//
//  Created by liuPeng on 16/2/26.
//  Copyright © 2016年 liuPeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array  = @[@"one", @"two", @"three"];
        // insert code here...
        NSLog(@"%@", [array description]);
        
        /* Use fast enumeration to travelse. */
        for (NSString *string in array) {
            NSLog(@"I found %@", string);
        }
        
        /* Use block to travelse. */
        [array enumerateObjectsUsingBlock:^(NSString *string, NSUInteger index, BOOL *stop) {
            NSLog(@"I found %@, index:%lu", string, index);
        }];
    }
    return 0;
}
