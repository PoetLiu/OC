//
//  main.m
//  08.06 NSValue
//
//  Created by liupeng on 16/2/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSRect rect = NSMakeRect(1, 2, 30, 40);
		NSValue *value = [NSValue valueWithBytes:&rect objCType:@encode(NSRect)];
		NSLog(@"%@", value);
		NSRect rect1;
		[value getValue:&rect1];
		NSLog(@"%f, %f, %f, %f", rect1.origin.x, rect1.origin.y, rect1.size.height, rect1.size.width);
		
	}
    return 0;
}
