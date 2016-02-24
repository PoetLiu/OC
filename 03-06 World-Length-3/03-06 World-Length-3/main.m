//
//  main.m
//  03-06 World-Length-3
//
//  Created by liupeng on 16/2/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#define WORD_FILE_PATH	"/tmp/words.txt"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		FILE *wordFile = fopen(WORD_FILE_PATH, "r");
		char word[100];
		
		if (wordFile == nil) {
			NSLog(@"open %s word file faild", WORD_FILE_PATH);
			return -1;
		}
		
		while (fgets(word, 100, wordFile)) {
			word[strlen(word)-1]	= '\0';
			NSLog(@"%s is %lu characters long", word, strlen(word));
		}
		fclose(wordFile);
	}
    return 0;
}
