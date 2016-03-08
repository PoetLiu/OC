//
//  main.m
//  08.07 FileWalker
//
//  Created by liupeng on 16/2/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSFileManager *manager;
		manager = [NSFileManager defaultManager];
		
		NSString *home;
		home	= [@"~" stringByExpandingTildeInPath];
		NSLog(@"HOME:%@", home);
		
		NSDirectoryEnumerator *dirEnum;
		dirEnum	= [manager enumeratorAtPath:home];
	
		NSMutableArray *files;
		files	= [NSMutableArray arrayWithCapacity:42];
		
		NSString *fileName;
		while (fileName = [dirEnum nextObject]) {
			if ([[fileName pathExtension] isEqualTo:@"jpg"]) {
				[files addObject:fileName];
			}
		}
		
		NSEnumerator *fileEnum;
		fileEnum	= [files objectEnumerator];
		
		while (fileName = [fileEnum nextObject]) {
			NSLog(@"%@", fileName);
		}
	}
    return 0;
}
