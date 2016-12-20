//
//  CalculatorOprator.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorOperator.h"

@implementation CalculatorOperator
static NSString *domain = @"com.lp.Calculator.Operator.ErrorDomain";

-(instancetype)initWithOperatorType:(CalcOperatorType)type {
	if (self = [super initWithElementType:CalcElementTypeOperator]) {
		self.operatorType	= type;
		switch (type) {
			case CalcOperatorTypeLeftBracket:
			case CalcOperatorTypeRightBracket:
			case CalcOperatorTypePlus:
			case CalcOperatorTypeMinus:
				self.priority	= CalcOperatorPriorityNormal;
				break;
			case CalcOperatorTypeDivide:
			case CalcOperatorTypeMultiply:
				self.priority	= CalcOperatorPriorityHigh;
				break;
			case CalcOperatorTypeErr:
				return nil;
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
		case '(':
			return CalcOperatorTypeLeftBracket;
		case ')':
			return CalcOperatorTypeRightBracket;
  		default:
			return CalcOperatorTypeErr;
			break;
	}
}

-(CalculatorOperand*) calculateWithLeftOperand:(CalculatorOperand *)left
								  rightOperand:(CalculatorOperand *)right
									 withError:(NSError **)error {
	double result = 0.0f;
	switch (self.operatorType) {
		case CalcOperatorTypePlus:
			result = [left.value doubleValue] + [right.value doubleValue];
			break;
		case CalcOperatorTypeMinus:
			result = [left.value doubleValue] - [right.value doubleValue];
			break;
		case CalcOperatorTypeDivide:
			if ([right.value doubleValue] == 0.0) {
				NSString *desc = NSLocalizedString(@"Divide error", @"division by zero");
    			NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
				NSError *err	= [NSError errorWithDomain:domain code:-1 userInfo:userInfo];
				*error	= err;
				return nil;
			}
			result = [left.value doubleValue] / [right.value doubleValue];
			break;
		case CalcOperatorTypeMultiply:
			result = [left.value doubleValue] * [right.value doubleValue];
			break;
		case CalcOperatorTypeErr:
		case CalcOperatorTypeLeftBracket:
		case CalcOperatorTypeRightBracket:
			break;
		default:
			return nil;
			break;
	}
	return [[CalculatorOperand alloc] initWithValue:[NSString stringWithFormat:@"%lf", result]];
}
-(NSString *)description {
	return [NSString stringWithFormat:@"Operator type:%ld", self.operatorType];
}
@end
