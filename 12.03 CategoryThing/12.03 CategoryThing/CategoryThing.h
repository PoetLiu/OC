//
//  CategoryThing.h
//  12.03 CategoryThing
//
//  Created by liupeng on 16/3/2.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryThing : NSObject
{
	NSInteger thing1;
	NSInteger thing2;
	NSInteger thing3;
}
@end // CategoryThing

@interface CategoryThing (Thing1)
- (void) setThing1:(NSInteger)thing1;
- (NSInteger)thing1;
@end

@interface CategoryThing (Thing2)
- (void) setThing2:(NSInteger)thing2;
- (NSInteger)thing2;
@end

@interface CategoryThing (Thing3)
- (void) setThing3:(NSInteger)thing3;
- (NSInteger)thing3;
@end
