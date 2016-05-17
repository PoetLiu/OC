//
//  Calculator.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Calculator.h"
#import "CalculatorOperator.h"

@implementation Calculator

typedef enum CalcParseState {
	CalcParseStateInit,
	CalcParseStateStart,
	CalcParseStateOperand,
	CalcParseStateOperator,
	CalcParseStateEnd
}CalcParseState;

+(NSArray *)parseWithExpression:(nonnull NSString *)expression {
	CalcParseState state = CalcParseStateInit;
	NSMutableArray *param = [[NSMutableArray alloc] init];
	int operandStart = 0, operandEnd = 0, operator = 0, i = 0;
	for (i = 0; i < [expression length]; i++) {
		unichar c = [expression characterAtIndex:i];
		NSLog(@"%d", c);
		switch (state) {
			case CalcParseStateInit:
				if ([CalculatorOperand characterIsOperand:c]) {
					state	= CalcParseStateOperand;
					operandStart	= i;
				} else {
					NSLog(@"expression not start with num.");
					goto ret;
				}
				break;
			case CalcParseStateOperand:
				if ([CalculatorOperator characterIsOperator:c]) {
					state	= CalcParseStateOperator;
					operator	= i;
					operandEnd	= i - 1;
					NSString *operand = [expression substringWithRange:NSMakeRange(operandStart, operandEnd - operandStart + 1)];
					CalculatorOperand *new = [[CalculatorOperand alloc] initWithValue:operand];
					[param addObject:new];
				}
				break;
			case CalcParseStateOperator:
				if ([CalculatorOperand characterIsOperand:c]) {
					state	= CalcParseStateOperand;
					operandStart	= i;
					CalculatorOperator *new = [[CalculatorOperator alloc] initWithOperatorType:[CalculatorOperator characterOperatorType:[expression characterAtIndex:operator]]];
					[param addObject:new];
				} else {
					NSLog(@"Operator not followed by operand.");
					goto ret;
				}
				break;
			default:
				break;
		}
	}
	
	if (state == CalcParseStateOperand) {
		operandEnd	= i - 1;
		NSString *operand = [expression substringWithRange:NSMakeRange(operandStart, operandEnd - operandStart + 1)];
		CalculatorOperand *new = [[CalculatorOperand alloc] initWithValue:operand];
		[param addObject:new];
		state	= CalcParseStateEnd;
	}
	
ret:
	if (state != CalcParseStateEnd) {
		NSLog(@"Parse expression faild, expression:%@, state:%d", expression, state);
		return nil;
	}
	NSLog(@"%@", param);
	return param;
}

+(NSString *)calculateWithExpression:(nonnull NSString *)expression {
	NSArray *param = [Calculator parseWithExpression:expression];
	if (param == NULL) {
		NSLog(@"parse expression faild.");
		return nil;
	}
	return [Calculator calculator:param];
}

+(NSString *)calculator:(NSArray *)params {
	CalculatorOperator *operator;
	NSMutableArray *results = [NSMutableArray arrayWithArray:params];
	NSString *res = nil;
	
	while ((operator = [Calculator nextOperator:results])) {
		NSInteger indexOperator	= [results indexOfObject:operator];
		CalculatorOperand *left = [results objectAtIndex:indexOperator-1];
		CalculatorOperand *right = [results objectAtIndex:indexOperator+1];
		CalculatorOperand *resultOperand = [operator calculateWithLeftOperand:left rightOperand:right];
		[results replaceObjectAtIndex:indexOperator withObject:resultOperand];
		[results removeObjectsInArray:@[left, right]];
	}
	res = ((CalculatorOperand *)[results firstObject]).value;
	return [Calculator resultTrim:res];
}

+(CalculatorOperator *)nextOperator:(NSMutableArray *)params {
	CalculatorOperator *next;
	for (CalculatorElement *element in params) {
		if (element.elementType != CalcElementTypeOperator) {
			continue;
		}
		if (!next || ((CalculatorOperator *)element).priority > next.priority) {
			next	= (CalculatorOperator *)element;
		}
	}
	return next;
}

+(NSString *)resultTrim:(NSString *)res {
    NSUInteger zeroNum = 0;
    for (NSInteger i = (NSInteger)[res length]-1; i >= 0; i--) {
        if ([res characterAtIndex:i] == '0') {
            zeroNum++;
        } else {
            break;
        }
    }
	if ([res characterAtIndex:[res length]-1-zeroNum] == '.')
		zeroNum++;
    return [res substringWithRange:NSMakeRange(0, [res length]-zeroNum)];
}

@end
