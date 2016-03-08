//
//  main.m
//  08.04 NSMutableString
//
//  Created by liupeng on 16/2/26.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		/* String append. */
		NSMutableString *string	= [NSMutableString stringWithCapacity:42];
		[string appendString:@"Hello there "];
		[string appendFormat:@"human %d!", 39];
		NSLog(@"%@", string);
		
		/* Character del in string. */
		NSMutableString *friends = [NSMutableString stringWithCapacity:50];
		[friends appendString:@"James BethLynn Jack Evan"];
		NSRange jackRange	= [friends rangeOfString:@"Jack"];
		NSLog(@"deleting \"Jack\" in %@", friends);
		if (jackRange.location != NSNotFound) {
			jackRange.length++;
			[friends deleteCharactersInRange:jackRange];
		}
		NSLog(@"After del, %@", friends);
	}
    return 0;
}
