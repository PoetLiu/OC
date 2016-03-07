//
//  main.m
//  17.01 PropertyListing
//
//  Created by liupeng on 16/3/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSDate *date	= [NSDate date];
		NSLog(@"today is %@", date);
		
		NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:-(24*60*60)];
		NSLog(@"yesterday is %@", yesterday);
		
		const char *string = "Hi there, this is a C string!";
		NSData *data	= [NSData dataWithBytes:string length:strlen(string)+1];
		NSLog(@"data is %@", data);
		NSLog(@"%lu byte string is '%s'", [data length], [data bytes]);
		
		NSArray *phrase;
		phrase	= [NSArray arrayWithObjects:@"I", @"seem", @"to", @"be", @"a", @"verb", nil];
		[phrase writeToFile:@"/tmp/verbiage.txt" atomically:YES];
		/* Content of /tmp/verbiage.txt
		 <?xml version="1.0" encoding="UTF-8"?>
		 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
		 <plist version="1.0">
		 <array>
		 <string>I</string>
		 <string>seem</string>
		 <string>to</string>
		 <string>be</string>
		 <string>a</string>
		 <string>verb</string>
		 </array>
		 </plist>		 
		 */
		
		NSArray *phrase2 = [NSArray arrayWithContentsOfFile:@"/tmp/verbiage.txt"];
		NSLog(@"%@", phrase2);
	}
    return 0;
}
