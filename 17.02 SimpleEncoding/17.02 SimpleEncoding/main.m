//
//  main.m
//  17.02 SimpleEncoding
//
//  Created by liupeng on 16/3/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Thingie.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Thingie *thing1;
		thing1	= [[Thingie alloc] initWithName:@"thing1" magicNumber:42 shoeSize:10.5];
		
		Thingie *anotherThing;
		anotherThing	= [[[Thingie alloc]
							initWithName:@"thing2"
							magicNumber:23
							shoeSize:13.0] autorelease];
		[thing1.subThingies addObject:anotherThing];
		anotherThing	= [[[Thingie alloc]
							initWithName:@"thing3"
							magicNumber:17
							shoeSize:9.0] autorelease];
		[thing1.subThingies addObject:anotherThing];
		NSLog(@"thing with things:%@", thing1);
		
		NSData *freezeDried;
		freezeDried	= [NSKeyedArchiver archivedDataWithRootObject:thing1];
		
		[thing1 release];
		thing1	= [NSKeyedUnarchiver unarchiveObjectWithData:freezeDried];
		NSLog(@"reconstituted thing:%@", thing1);
	}
    return 0;
}
