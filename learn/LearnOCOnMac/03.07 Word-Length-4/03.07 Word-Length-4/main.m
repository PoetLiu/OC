//
//  main.m
//  03.07 Word-Length-4
//
//  Created by liupeng on 16/2/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		if (argc == 1) {
			NSLog(@"you need to provide a file name");
			return (1);
		}
		
		FILE *wordFile = fopen(argv[1], "r");
		char word[100];
		
		if (wordFile == nil) {
			NSLog(@"open %s faild.", argv[1]);
			return (2);
		}
		
		while (fgets(word, 100, wordFile)) {
			word[strlen(word) -1]	= '\0';
			NSLog(@"%s is %lu characters long", word, strlen(word));
		}
		fclose(wordFile);
	}
    return 0;
}
