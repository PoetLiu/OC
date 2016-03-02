//
//  main.m
//  12.03 CategoryThing
//
//  Created by liupeng on 16/3/2.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategoryThing.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	 CategoryThing *thing	= [[CategoryThing alloc] init];
		[thing setThing1:5];
		[thing setThing2:23];
		[thing setThing3:42];
		NSLog(@"Things are %@", thing);
	}
    return 0;
}
