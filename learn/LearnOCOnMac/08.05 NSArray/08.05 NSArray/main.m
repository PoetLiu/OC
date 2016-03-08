//
//  main.m
//  08.05 NSArray
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    /* Create NSArray. */
		NSArray *array	= [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
		NSArray *array1 = @[@"one", @"two", @"three"];
		NSLog(@"array:%@", [array description]);
		NSLog(@"array1:%@", [array1 description]);
		
		for (NSInteger i = 0; i < [array count]; i++) {
			NSLog(@"index %ld has %@.", i, [array objectAtIndex:i]);
		}
		for (NSInteger i = 0; i < [array count]; i++) {
			NSLog(@"index %ld has %@.", i, array[i]);
		}
		
		NSString *string = @"oop:ack:bork:greebe:ponies";
		NSArray	*chunks	= [string componentsSeparatedByString:@":"];
		NSLog(@"chunks:%@", chunks);
		
		NSString *string1 = [chunks componentsJoinedByString:@":-)"];
		NSLog(@"joined:%@", string1);
	}
    return 0;
}
