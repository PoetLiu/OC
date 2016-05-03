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
				self.calculate	= calculatePlus;
				self.priority	= CalcOperatorPriorityNormal;
				break;
			case CalcOperatorTypeMinus:
				self.calculate	= calculateMinus;
				self.priority	= CalcOperatorPriorityNormal;
				break;
			case CalcOperatorTypeDivide:
				self.calculate	= calculateDivide;
				self.priority	= CalcOperatorPriorityHigh;
				break;
			case CalcOperatorTypeMultiply:
				self.calculate	= calculateMultiply;
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

CalculatorOperand* calculatePlus(CalculatorOperand *left, CalculatorOperand *right) {
	if (left == nil || right == nil) {
		return nil;
	};
	double result = [left.value doubleValue] + [right.value doubleValue];
	return [[CalculatorOperand alloc] initWithValue:[NSString stringWithFormat:@"%lf", result]];
}

CalculatorOperand* calculateMinus(CalculatorOperand *left, CalculatorOperand *right) {
	if (left == nil || right == nil) {
		return nil;
	}
	double result = [left.value doubleValue] - [right.value doubleValue];
	return [[CalculatorOperand alloc] initWithValue:[NSString stringWithFormat:@"%lf", result]];
}

CalculatorOperand* calculateDivide(CalculatorOperand *left, CalculatorOperand *right) {
	if (left == nil || right == nil) {
		return nil;
	}
	double result = [left.value doubleValue] / [right.value doubleValue];
	return [[CalculatorOperand alloc] initWithValue:[NSString stringWithFormat:@"%lf", result]];
}

CalculatorOperand* calculateMultiply(CalculatorOperand *left, CalculatorOperand *right) {
	if (left == nil || right == nil) {
		return nil;
	}
	double result = [left.value doubleValue] * [right.value doubleValue];
	return [[CalculatorOperand alloc] initWithValue:[NSString stringWithFormat:@"%lf", result]];
}

-(NSString *)description {
	return [NSString stringWithFormat:@"Operator type:%d priority:%d", self.operatorType, self.priority];
}

@end
