//
//  main.m
//  04.01 Shapes-Inheritance
//
//  Created by liupeng on 16/2/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	kCicle,
	kRectangle,
	kEgg
} ShapeType;

typedef enum {
	kRedColor,
	kGreenColor,
	kBlueColor
} ShapeColor;

typedef struct {
	int x, y, width, height;
} ShapeRect;

NSString *colorName (ShapeColor colorName)
{
	switch (colorName) {
		case kRedColor:
			return @"red";
			break;
		case kGreenColor:
			return @"green";
			break;
		case kBlueColor:
			return @"blue";
			break;
		default:
			break;
	}
	return @"no clue";
}

@interface Shape : NSObject
{
	ShapeColor fillColor;
	ShapeRect bounds;
}
- (void) setFillColor: (ShapeColor) fillColor;
- (void) setBounds: (ShapeRect) bounds;
- (void) draw;
@end

@implementation Shape
- (void) setFillColor: (ShapeColor) c
{
	fillColor	= c;
}
- (void) setBounds: (ShapeRect) b
{
	bounds	= b;
}
- (void) draw
{
} // draw
@end

@interface Circle : Shape
@end
@implementation Circle
- (void) draw
{
	NSLog(@"draw a circle at (%d %d %d %d) in %@", bounds.x, bounds.y,
		  bounds.width, bounds.height, colorName(fillColor));
}
@end

@interface Rectangle : Shape
@end
@implementation Rectangle
- (void) draw
{
	NSLog(@"draw a Rectangle at (%d %d %d %d) in %@", bounds.x, bounds.y,
		  bounds.width, bounds.height, colorName(fillColor));
}
@end

@interface Egg : Shape
@end
@implementation Egg
- (void) draw
{
	NSLog(@"draw a Egg at (%d %d %d %d) in %@", bounds.x, bounds.y,
		  bounds.width, bounds.height, colorName(fillColor));
}
@end

@interface Triangle : Shape
@end
@implementation Triangle
- (void) draw
{
	NSLog(@"draw a Triangle at (%d %d %d %d) in %@", bounds.x, bounds.y,
		  bounds.width, bounds.height, colorName(fillColor));
}
@end

#define GET_ARRAY_SIZE(a)	(sizeof(a)/sizeof(a[0]))
int main(int argc, const char * argv[]) {
	@autoreleasepool {
		id shapes[4];
		
		ShapeRect rect0 = {0, 0, 10, 30};
		shapes[0]	= [Circle new];
		[shapes[0] setBounds: rect0];
		[shapes[0] setFillColor: kRedColor];
		
		ShapeRect rect1 = {30, 40, 50, 60};
		shapes[1]	= [Rectangle new];
		[shapes[1] setBounds: rect1];
		[shapes[1] setFillColor: kGreenColor];
		
		ShapeRect rect2	= {15, 19, 37, 29};
		shapes[2]	= [Egg new];
		[shapes[2] setBounds:rect2];
		[shapes[2] setFillColor: kBlueColor];
		
		ShapeRect rect3	= {47, 32, 80, 50};
		shapes[2]	= [Triangle new];
		[shapes[2] setBounds:rect3];
		[shapes[2] setFillColor: kRedColor];
		
		for (int i = 0; i < GET_ARRAY_SIZE(shapes); i++) {
			id shape	= shapes[i];
			[shape draw];
		}
	}
	return 0;
}

