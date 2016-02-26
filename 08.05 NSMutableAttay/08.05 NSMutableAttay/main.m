//
//  main.m
//  08.05 NSMutableAttay
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSMutableArray *array	= [NSMutableArray arrayWithCapacity:17];
		for (NSInteger i = 0; i < 4; i++) {
			NSString *string = [NSString stringWithFormat:@"I am %ld", i];
			[array addObject:string];
		}
		NSLog(@"%@", array);
		[array removeObjectAtIndex:1];
		NSLog(@"%@", array);
	}
    return 0;
}
