//
//  main.m
//  12.04 iTunesFinder
//
//  Created by liupeng on 16/3/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITunesFinder.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	
		NSNetServiceBrowser *browser	= [[NSNetServiceBrowser alloc] init];
		ITunesFinder *finder	= [[ITunesFinder alloc] init];
		[browser setDelegate:finder];
		[browser searchForServicesOfType:@"_daap._tcp" inDomain:@"local."];
		NSLog(@"begun browing");
		[[NSRunLoop currentRunLoop] run];
	}
    return 0;
}
