//
//  Calculator.m
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Calculator.h"
#import "CalculatorOperator.h"

@interface Calculator ()
@property (nonatomic, strong) NSMutableArray *operandStack;
@property (nonatomic, strong) NSMutableArray *operatorStack;
@end

static NSString *domain = @"com.lp.Calculator.ErrorDomain";
@implementation Calculator

typedef NS_ENUM (NSUInteger, CalcParseState) {
	CalcParseStateInit,
	CalcParseStateStart,
	CalcParseStateOperand,
	CalcParseStateOperator,
	CalcParseStateEnd
};

-(instancetype)init {
	if (self = [super init]) {
		_operandStack	= [[NSMutableArray alloc] init];
		_operatorStack	= [[NSMutableArray alloc] init];
	}
	return self;
}

/*
 res: 80.0000
 Trimming the tail ".0000", and just return 80.
 */
-(NSString *)resultTrim:(NSString *)res {
    NSUInteger zeroNum = 0;
    NSInteger i = 0;
    for (i = (NSInteger)[res length]-1; i >= 0; i--) {
        if ([res characterAtIndex:i] == '0') {
            zeroNum++;
        } else {
            break;
        }
    }
    if (i >= 0 && [res characterAtIndex:i] == '.') {
        zeroNum++;
        return [res substringWithRange:NSMakeRange(0, [res length]-zeroNum)];
    } else {
        return res;
    }
}

-(void)paramStackPushToPolish:(id)element {
	CalculatorOperator *operator = element, *topOperator = [self.operatorStack lastObject];
	CalculatorOperand *operand = element;
	
	switch ([element elementType]) {
		case CalcElementTypeOperand:
			[self.operandStack addObject:operand];
			break;
		case CalcElementTypeOperator:
		{
			if (([self.operatorStack count] == 0 || [topOperator operatorType] == CalcOperatorTypeRightBracket)
				|| ([operator operatorType] == CalcOperatorTypeRightBracket)) {
				[self.operatorStack addObject:operator];
				break;
			}
			
			if ([operator operatorType] != CalcOperatorTypeLeftBracket) {
				__block int add_flag	= 0;
				[self.operatorStack enumerateObjectsWithOptions:NSEnumerationReverse
												usingBlock:^(CalculatorOperator *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
					if ([operator priority] >= [obj priority]) {
						[self.operatorStack addObject:operator];
						add_flag	= 1;
						*stop	= TRUE;
					}
				}];
				if (!add_flag) {
					[self.operatorStack insertObject:operator atIndex:0];
				}
				break;
			} else {	// is left bracket.
				[self.operatorStack enumerateObjectsWithOptions:NSEnumerationReverse
												usingBlock:^(CalculatorOperator *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
					if ([obj operatorType] == CalcOperatorTypeRightBracket) {
						*stop	= TRUE;
					} else {
						[self.operandStack addObject:obj];
					}
					[self.operatorStack removeObject:obj];
				}];
			}
			break;
		}
		default:
			break;
	}
	NSLog(@"pushed:%@ operand:%@ operator:%@", element, self.operandStack, self.operatorStack);
	return;
}

-(void)paramStackPushDone{
	[self.operatorStack enumerateObjectsWithOptions:NSEnumerationReverse
									usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			[self.operandStack addObject:obj];
			[self.operatorStack removeObject:obj];
	}];
	NSLog(@"param stack push done. param:%@", self.operandStack);
	// divide the operand and operator.
	[self.operandStack enumerateObjectsWithOptions:NSEnumerationReverse
									usingBlock:^(CalculatorElement *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			if ([obj elementType] == CalcElementTypeOperator) {
				[self.operatorStack insertObject:obj atIndex:0];
				[self.operandStack removeObject:obj];
			}
	}];
	NSLog(@"after devide operand and operator, operand:%@, operator:%@", self.operandStack, self.operatorStack);
}

-(id)paramStackPop:(CalcElementType)elementType {
	id result = 0;
	switch (elementType) {
  		case CalcElementTypeOperator:
			result	= [self.operatorStack lastObject];
			[self.operatorStack removeObject:result];
			break;
		case CalcElementTypeOperand:
			result	= [self.operandStack lastObject];
			[self.operandStack removeObject:result];
  		default:
			break;
	}
	NSLog(@"Poped out:%@", result);
	return result;
}

-(void)paramStackPush:(id)element {
	switch ([element elementType]) {
		case CalcElementTypeOperator:
			[self.operatorStack addObject:element];
			break;
		case CalcElementTypeOperand:
			[self.operandStack addObject:element];
		default:
			break;
	}
	NSLog(@"Pushed in:%@", element);
	return;
}


/*
 * Parse to Polish Notation.
 */
-(BOOL)parseWithExpression:(nonnull NSString *)expression withError:(NSError **)error{
	CalcParseState state = CalcParseStateInit;
	NSString *errDes = nil;
	int operandStart = 0, operandEnd = 0, operator = 0, i = 0;
	for (i = (int)[expression length]-1; i >= 0; i--) {
		unichar c = [expression characterAtIndex:i];
		NSLog(@"%c", c);
		switch (state) {
			case CalcParseStateInit:
				if ([CalculatorOperand characterIsOperand:c]) {
					state	= CalcParseStateOperand;
					operandEnd	= i;
				} else if (c == '(' || c == ')') {
					state	= CalcParseStateOperator;
					operator	= i;
				} else {
					errDes	= @"expression not end with num";
				}
				break;
			case CalcParseStateOperand:
				if ([CalculatorOperator characterIsOperator:c]) {
					state	= CalcParseStateOperator;
					operator	= i;
					operandStart	= i + 1;
					NSString *operand = [expression substringWithRange:NSMakeRange(operandStart, operandEnd - operandStart + 1)];
					CalculatorOperand *new = [[CalculatorOperand alloc] initWithValue:operand];
					[self paramStackPushToPolish:new];
				}
				break;
			case CalcParseStateOperator:
				if ([CalculatorOperand characterIsOperand:c]) {
					state	= CalcParseStateOperand;
					operandEnd	= i;
					CalculatorOperator *new = [[CalculatorOperator alloc] initWithOperatorType:
											   [CalculatorOperator characterOperatorType:
												[expression characterAtIndex:operator]]];
					[self paramStackPushToPolish:new];
				} else if ([CalculatorOperator characterIsOperator:c]) {
					operator	= i+1;
					CalculatorOperator *new = [[CalculatorOperator alloc] initWithOperatorType:
											   [CalculatorOperator characterOperatorType:
												[expression characterAtIndex:operator]]];
					[self paramStackPushToPolish:new];
				}
				break;
			default:
				break;
		}
	}
	
	if (state == CalcParseStateOperand) {
		operandStart	= i + 1;
		NSString *operand = [expression substringWithRange:NSMakeRange(operandStart, operandEnd - operandStart + 1)];
		CalculatorOperand *new = [[CalculatorOperand alloc] initWithValue:operand];
		[self paramStackPushToPolish:new];
		state	= CalcParseStateEnd;
	}
	[self paramStackPushDone];
	
ret:
	if (errDes) {
		NSLog(@"Parse expression faild, expression:%@, state:%lu err_des:%@", expression, state, errDes);
		NSString *desc = NSLocalizedString(@"Parse expression faild", err_des);
		NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : desc };
		*error	= [NSError errorWithDomain:domain code:-2 userInfo:userInfo];
		return false;
	}
	NSLog(@"%@", self.operandStack);
	return true;
}

-(NSString *)calculatorWithError:(NSError **)error{
	CalculatorOperator *operator;
	NSString *res = nil;
	
	while ((operator = [self paramStackPop:CalcElementTypeOperator])) {
		CalculatorOperand *left = [self paramStackPop:CalcElementTypeOperand];
		CalculatorOperand *right = [self paramStackPop:CalcElementTypeOperand];
		CalculatorOperand *resultOperand = [operator calculateWithLeftOperand:left rightOperand:right withError:error];
		if (*error) {
			NSLog(@"some thing wrong, stop calculating..");
			return nil;
		}
		[self paramStackPush:resultOperand];
	}
	res = ((CalculatorOperand *)[self.operandStack firstObject]).value;
	return [self resultTrim:res];
}

-(NSString *)calculateWithExpression:(nonnull NSString *)expression withError:(NSError **)error {
	[self.operandStack removeAllObjects];
	[self.operatorStack removeAllObjects];
	[self parseWithExpression:expression withError:error];
	if (*error) {
		NSLog(@"parse expression faild.");
		return nil;
	}
	return [self calculatorWithError:error];
}

@end
