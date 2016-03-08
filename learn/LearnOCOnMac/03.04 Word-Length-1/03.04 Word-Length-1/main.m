//
//  main.m
//  03.04 Word-Length-1
//
//  Created by liupeng on 16/2/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#define GET_ARRAY_SIZE(a)	(sizeof(a)/sizeof(a[0]))

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		const char *words[]	= {"aardvark", "abacus", "allude", "zygote"};
		for (int i = 0; i < GET_ARRAY_SIZE(words); i++) {
			NSLog(@"%s is %lu characters long", words[i], strlen(words[i]));
		}
	}
    return 0;
}
