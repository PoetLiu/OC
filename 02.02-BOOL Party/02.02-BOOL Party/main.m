//
//  main.m
//  02.02-BOOL Party
//
//  Created by liuPeng on 16/2/23.
//  Copyright © 2016年 liuPeng. All rights reserved.
//

#import <Foundation/Foundation.h>

// returns NO if the two integers have the same value,
// YES otherwise
BOOL areIntDifferent(int thing1, int thing2)
{
    if (thing1 == thing2) {
        return (NO);
    } else {
        return (YES);
    }

}// areIntDifferent

// given a NO value, return the human-readable
// string "NO", otherwise return "YES"
NSString *boolString(BOOL yesNo)
{
    if (yesNo == NO) {
        return (@"NO");
    } else {
        return (@"YES");
    }
}// boolString

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL areTheyDifferent;
        areTheyDifferent    = areIntDifferent(5, 5);
        NSLog(@"Are %d and %d different? %@", 5, 5, boolString(areTheyDifferent));
        
        areTheyDifferent    = areIntDifferent(23, 42);
        NSLog(@"are %d and %d different? %@", 23, 42, boolString(areTheyDifferent));
    }
    return 0;
}// main
