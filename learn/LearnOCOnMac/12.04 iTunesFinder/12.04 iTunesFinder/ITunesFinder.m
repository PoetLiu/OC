//
//  ITunesFinder.m
//  12.04 iTunesFinder
//
//  Created by liupeng on 16/3/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ITunesFinder.h"

@implementation ITunesFinder
- (void) netServiceBrowser:(NSNetServiceBrowser *)b didFindService:(NSNetService *)service moreComing:(BOOL)moreComing {
	[service resolveWithTimeout:10];
	NSLog(@"found one ! Name is %@", [service name]);
} // didFindService
- (void) netServiceBrowser:(NSNetServiceBrowser *)b didRemoveService:(NSNetService *)service moreComing:(BOOL)moreComing {
	[service resolveWithTimeout:10];
	NSLog(@"Lost one! Name is %@", [service name]);
} // didRemoveService
@end
