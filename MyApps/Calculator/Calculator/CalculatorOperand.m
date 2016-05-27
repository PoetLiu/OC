//
//  CalculatorOperand.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorOperand.h"

@implementation CalculatorOperand
-(instancetype)initWithValue:(NSString *)value {
	if (self = [super initWithElementType:CalcElementTypeOperand]) {
		_value	= [value copy];
	}
	return self;
}

+(BOOL)characterIsOperand:(unichar)c
{
	return isalnum(c) || c == '.';
}

-(NSString *)description {
	return [NSString stringWithFormat:@"Operand vaule:%@", self.value];
}
@end
