//
//  main.m
//  12.01 Category
//
//  Created by liupeng on 16/3/2.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NumberConvenience.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		[dict setObject:[@"hello" lengthAsNumber] forKey:@"hello"];
		[dict setObject:[@"iLikeFish" lengthAsNumber] forKey:@"iLikeFish"];
		[dict setObject:[@"Once upon a time" lengthAsNumber] forKey:@"Onece upon a time"];
		NSLog(@"%@", dict);
	}
    return 0;
}
