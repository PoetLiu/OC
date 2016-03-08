//
//  Thingie.h
//  17.02 SimpleEncoding
//
//  Created by liupeng on 16/3/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Thingie : NSObject <NSCoding>
{
	NSString *name;
	int magicNumber;
	float shoeSize;
	NSMutableArray *subThingies;
}
@property (copy) NSString *name;
@property int magicNumber;
@property float shoeSize;
@property (retain) NSMutableArray *subThingies;
- (id) initWithName: (NSString *)n magicNumber:(int) mn shoeSize: (float) ss;
@end