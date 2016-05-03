//
//  CalculatorParser.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorParser.h"
#import "CalculatorOperand.h"
#import "CalculatorOperator.h"

typedef enum CalcParseState {
	CalcParseStateInit,
	CalcParseStateStart,
	CalcParseStateOperand,
	CalcParseStateOperator,
	CalcParseStateEnd
}CalcParseState;

@implementation CalculatorParser
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
@end
