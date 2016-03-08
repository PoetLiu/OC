//
//  main.m
//  08.06 NSNumber
//
//  Created by liupeng on 16/2/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSNumber *n1 = [NSNumber numberWithBool: YES];
		NSNumber *n2 = [NSNumber numberWithChar:'c'];
		NSNumber *n3 = [NSNumber numberWithInt:100];
		NSNumber *n4 = [NSNumber numberWithFloat:123.3f];
		
		NSNumber *n5 = @'X';
		NSNumber *n6 = @12345;
		NSNumber *n7 = @YES;
		NSNumber *n8 = @123.45f;
		
		NSLog(@"n1:%@, n2:%@, n3:%@, n4:%@, n5:%@, n6:%@, n7:%@, n8:%@",
			  n1, n2, n3, n4, n5, n6, n7, n8);
		
		NSLog(@"value of n2: char:%c, int:%d, bool:%d, NSString:%@, float:%f",
			  [n2 charValue], [n2 intValue], [n2 boolValue], [n2 stringValue],
			  [n2 floatValue]);
	}
    return 0;
}
