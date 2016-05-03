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
		NSLog(@"elemetType:%d", element.elementType);
		if (element.elementType != CalcElementTypeOperator) {
			NSLog(@"continue");
			continue;
		}
		if (!next || ((CalculatorOperator *)element).priority > next.priority) {
			next	= (CalculatorOperator *)element;
		}
	}
	NSLog(@"next:%@", next);
	return next;
}

+(NSString *)calculator:(NSArray *)params {
	CalculatorOperator *operator;
	NSMutableArray *results = [NSMutableArray arrayWithArray:params];
	
	while ((operator = [Calculator nextOperator:results])) {
		NSInteger indexOperator	= [results indexOfObject:operator];
		CalculatorOperand *left = [results objectAtIndex:indexOperator-1];
		CalculatorOperand *right = [results objectAtIndex:indexOperator+1];
		NSLog(@"operator:%ld left:%@ right:%@", (long)indexOperator, left, right);
		CalculatorOperand *resultOperand = operator.calculate(left, right);
		[results replaceObjectAtIndex:indexOperator withObject:resultOperand];
		[results removeObjectsInArray:@[left, right]];
	}
	NSLog(@"result:%@", results);
	return ((CalculatorOperand *)[results firstObject]).value;
}
@end
