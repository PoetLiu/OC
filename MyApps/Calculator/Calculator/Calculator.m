//
//  Calculator.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Calculator.h"
#import "CalculatorOperator.h"
#import "CalculatorParser.h"

@implementation Calculator

+(NSString *)calculateWithExpression:(nonnull NSString *)expression {
	NSArray *param = [CalculatorParser parseWithExpression:expression];
	if (param == NULL) {
		NSLog(@"parse expression faild.");
		return nil;
	}
	return [Calculator calculator:param];
}

+(CalculatorOperator *)nextOperator:(NSMutableArray *)params {
	CalculatorOperator *next;
	for (CalculatorElement *element in params) {
		if (element.elementType != CalcElementTypeOperator) {
			NSLog(@"continue");
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
    return [res substringWithRange:NSMakeRange(0, [res length]-zeroNum-1)];
}

+(NSString *)calculator:(NSArray *)params {
	CalculatorOperator *operator;
	NSMutableArray *results = [NSMutableArray arrayWithArray:params];
    NSString *res = nil;
	
	while ((operator = [Calculator nextOperator:results])) {
		NSInteger indexOperator	= [results indexOfObject:operator];
		CalculatorOperand *left = [results objectAtIndex:indexOperator-1];
		CalculatorOperand *right = [results objectAtIndex:indexOperator+1];
        CalculatorOperand *resultOperand = operator.calculate(left, right);
		[results replaceObjectAtIndex:indexOperator withObject:resultOperand];
		[results removeObjectsInArray:@[left, right]];
	}
	res = ((CalculatorOperand *)[results firstObject]).value;
    return [Calculator resultTrim:res];
}
@end
