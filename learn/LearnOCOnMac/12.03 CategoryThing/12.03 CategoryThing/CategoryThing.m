//
//  CategoryThing.m
//  12.03 CategoryThing
//
//  Created by liupeng on 16/3/2.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CategoryThing.h"

@implementation CategoryThing
- (NSString *) description
{
	NSString *desc;
	desc	= [NSString stringWithFormat:@"%ld %ld %ld", thing1, thing2, thing3];
	return (desc);
}
@end
