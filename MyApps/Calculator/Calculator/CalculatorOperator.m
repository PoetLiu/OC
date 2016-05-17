//
//  CalculatorOprator.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorOperator.h"

@implementation CalculatorOperator
-(instancetype)initWithOperatorType:(CalcOperatorType)type {
	if (self = [super initWithElementType:CalcElementTypeOperator]) {
		self.operatorType	= type;
		switch (type) {
			case CalcOperatorTypePlus:
			case CalcOperatorTypeMinus:
				self.priority	= CalcOperatorPriorityNormal;
				break;
			case CalcOperatorTypeDivide:
			case CalcOperatorTypeMultiply:
				self.priority	= CalcOperatorPriorityHigh;
				break;
			default:
				break;
		}
	}
	return self;
}

+(BOOL)characterIsOperator:(unichar)c {
	if ([CalculatorOperator characterOperatorType:c] != CalcOperatorTypeErr) {
		return YES;
	} else {
		return NO;
	}
}

+(CalcOperatorType)characterOperatorType:(unichar)c {
	switch (c) {
  		case '+':
			return CalcOperatorTypePlus;
			break;
		case '-':
			return CalcOperatorTypeMinus;
			break;
		case '*':
			return CalcOperatorTypeMultiply;
			break;
		case '/':
			return CalcOperatorTypeDivide;
  		default:
			return CalcOperatorTypeErr;
			break;
	}
}

-(CalculatorOperand*) calculateWithLeftOperand:(CalculatorOperand *)left rightOperand:(CalculatorOperand *)right {
	double result = 0.0f;
	switch (self.operatorType) {
		case CalcOperatorTypePlus:
			result = [left.value doubleValue] + [right.value doubleValue];
			break;
		case CalcOperatorTypeMinus:
			result = [left.value doubleValue] - [right.value doubleValue];
			break;
		case CalcOperatorTypeDivide:
			result = [left.value doubleValue] / [right.value doubleValue];
			break;
		case CalcOperatorTypeMultiply:
			result = [left.value doubleValue] * [right.value doubleValue];
			break;
		default:
			return nil;
			break;
	}
	return [[CalculatorOperand alloc] initWithValue:[NSString stringWithFormat:@"%lf", result]];
}
@end
