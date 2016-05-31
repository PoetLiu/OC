//
//  CalculatorElement.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorElement.h"

@implementation CalculatorElement
-(instancetype)initWithElementType:(CalcElementType)type {
	if (self = [super init]) {
		_elementType	= type;
	}
	return self;
}
-(NSString *)description {
	return [NSString stringWithFormat:@"%lu", _elementType];
}
@end
