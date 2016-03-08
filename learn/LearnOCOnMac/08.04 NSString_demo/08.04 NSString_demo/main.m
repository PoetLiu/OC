//
//  main.m
//  08.04 NSString_demo
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		/* String obj create with factory method. */
		NSString *height;
		height	= [NSString stringWithFormat:@"你好,You height is %d feet, %d inches", 5, 11];
	    NSLog(@"%@, length:%lu", height, [height length]);
		
		/* Is string content equal to other. */
		NSString *things1	= @"hello 5";
		NSString *things2	= [NSString stringWithFormat:@"hello %d", 5];
		NSLog(@"str1:%@ str2:%@", things1, things2);
		if ([things1 isEqualToString:things2]) {
			NSLog(@"They are the same!");
		} else {
			NSLog(@"They are different!");
		}
		
		/* String content compare to other. */
		NSString *s1	= @"abc";
		NSString *s2	= @"acd";
		NSComparisonResult cmpResult = [s1 compare:s2];
		NSLog(@"s1:%@ compare to s2:%@", s1, s2);
		if (cmpResult == NSOrderedSame) {
			NSLog(@"they are the same.");
		} else if (cmpResult == NSOrderedAscending) {
			NSLog(@"order ASC");
		} else {
			NSLog(@"order DES");
		}
		
		/* Juge the value of pointer. */
		if (s1 == s2) {
			NSLog(@"They are the ame object!");
		} else {
			NSLog(@"They are different objects.");
		}
		
		/* String include */
		NSString *fileName	= @"draft-chapter.pages";
		if ([fileName hasPrefix:@"draft"]) {
			NSLog(@"This is a draft.");
		}
		if ([fileName hasSuffix:@".mov"]) {
			NSLog(@"This is a movie");
		}
		NSRange range = [fileName rangeOfString:@"chapter"];
		if (range.location == NSNotFound) {
			NSLog(@"%@ is not include %@", fileName, @"chapter");
		} else {
			NSLog(@"%@ is include %@, location:%lu, length:%lu", fileName, @"chapter", range.location, range.length);
		}
	}
	return 0;
}
