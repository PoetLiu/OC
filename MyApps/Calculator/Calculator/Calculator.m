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
@property (nonatomic, strong) NSMutableArray *paramStack;
@property (nonatomic, strong) NSMutableArray *tmpStack;
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
		_paramStack	= [[NSMutableArray alloc] init];
		_tmpStack	= [[NSMutableArray alloc] init];
	}
	return self;
}

/*
 res: 80.0000
 Trimming the tail ".0000", and just return 80.
 */
-(NSString *)resultTrim:(NSString *)res {
    NSUInteger tailZeroSeqCnt = 0, hasPoint = 0, isSeq = 1;
    NSInteger i = 0;
    for (i = (NSInteger)[res length]-1; i >= 0; i--) {
        if (isSeq && [res characterAtIndex:i] == '0') {
            tailZeroSeqCnt++;
            continue;
        } else {
            isSeq   = 0;
        }
        
        if ([res characterAtIndex:i] == '.') {
            hasPoint    = 1;
        }
    }
    
    if ([res characterAtIndex:[res length]-tailZeroSeqCnt-1] == '.') {
        tailZeroSeqCnt++;
    }
    
    if (hasPoint) {
        return [res substringWithRange:NSMakeRange(0, [res length]-tailZeroSeqCnt)];
    } else {
        return res;
    }
}

-(void)paramStackPushToPolish:(id)element {
	CalculatorOperator *operator = element, *topOperator = [self.tmpStack lastObject];
	CalculatorOperand *operand = element;
	
	switch ([element elementType]) {
		case CalcElementTypeOperand:
			[self.paramStack addObject:operand];
			break;
		case CalcElementTypeOperator:
		{
			if (([self.tmpStack count] == 0 || [topOperator operatorType] == CalcOperatorTypeRightBracket)
				|| ([operator operatorType] == CalcOperatorTypeRightBracket)) {
				[self.tmpStack addObject:operator];
				break;
			}
			
			if ([operator operatorType] != CalcOperatorTypeLeftBracket) {
				[self.tmpStack enumerateObjectsWithOptions:NSEnumerationReverse
												usingBlock:^(CalculatorOperator *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
					if ([operator priority] < [obj priority]) {
						[self.paramStack addObject:obj];
                        [self.tmpStack removeObject:obj];
                    } else {
                        *stop	= TRUE;
                    }
				}];
                [self.tmpStack addObject:operator];
				break;
			} else {	// is left bracket.
				[self.tmpStack enumerateObjectsWithOptions:NSEnumerationReverse
												usingBlock:^(CalculatorOperator *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
					if ([obj operatorType] == CalcOperatorTypeRightBracket) {
						*stop	= TRUE;
					} else {
						[self.paramStack addObject:obj];
					}
					[self.tmpStack removeObject:obj];
				}];
			}
			break;
		}
		default:
			break;
	}
	NSLog(@"pushed:%@ operand:%@ operator:%@", element, self.paramStack, self.tmpStack);
	return;
}

-(void)paramStackPushDone{
	[self.tmpStack enumerateObjectsWithOptions:NSEnumerationReverse
									usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
			[self.paramStack addObject:obj];
			[self.tmpStack removeObject:obj];
	}];
	NSLog(@"param stack push done. param:%@", self.paramStack);
}

/*
 * Parse to Polish Notation.
 */
-(BOOL)parseWithExpression:(nonnull NSString *)expression withError:(NSError **)error{
	CalcParseState state = CalcParseStateInit;
	NSString *errDes = nil;
	int operandStart = 0, operandEnd = 0, operatorStart = 0, operatorEnd = 0, i = 0;
    unichar c = 0;
	for (i = (int)[expression length]-1; i >= 0; i--) {
		c = [expression characterAtIndex:i];
		NSLog(@"%c", c);
		switch (state) {
			case CalcParseStateInit:
				if ([CalculatorOperand characterIsOperand:c]) {
					state	= CalcParseStateOperand;
					operandEnd	= i;
				} else if (c == '(' || c == ')') {
					state	= CalcParseStateOperator;
					operatorEnd	= i;
				} else {
					errDes	= @"expression not end with num or bracket.";
				}
				break;
			case CalcParseStateOperand:
				if ([CalculatorOperator characterIsOperator:c]) {
					state	= CalcParseStateOperator;
					operatorEnd	= i;
					operandStart	= i + 1;
					NSString *operand = [expression substringWithRange:NSMakeRange(operandStart, operandEnd - operandStart + 1)];
					CalculatorOperand *new = [[CalculatorOperand alloc] initWithValue:operand];
					[self paramStackPushToPolish:new];
				}
				break;
			case CalcParseStateOperator:
				if ([CalculatorOperand characterIsOperand:c]) {
					state	= CalcParseStateOperand;
                    operatorStart   = i+1;
					operandEnd      = i;
                    for (int i = operatorEnd; i >= operatorStart; i--) {
                        CalculatorOperator *new = [[CalculatorOperator alloc] initWithOperatorType:
                                                   [CalculatorOperator characterOperatorType:
                                                    [expression characterAtIndex:i]]];
                        [self paramStackPushToPolish:new];
                    }
				}
				break;
			default:
				break;
		}
	}
	
	if ([CalculatorOperand characterIsOperand:c]) {
		operandStart	= i + 1;
		NSString *operand = [expression substringWithRange:NSMakeRange(operandStart, operandEnd - operandStart + 1)];
		CalculatorOperand *new = [[CalculatorOperand alloc] initWithValue:operand];
		[self paramStackPushToPolish:new];
		state	= CalcParseStateEnd;
    } else {
        operatorStart   = i + 1;
        for (int i = operatorEnd; i >= operatorStart; i--) {
            CalculatorOperator *new = [[CalculatorOperator alloc] initWithOperatorType:
                                       [CalculatorOperator characterOperatorType:
                                        [expression characterAtIndex:i]]];
            [self paramStackPushToPolish:new];
        }
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
	return true;
}

-(BOOL)nextOperator:(CalculatorOperator **)operator
                 id:(NSUInteger*)id
        leftOperand:(CalculatorOperand **)left
       rightOperand:(CalculatorOperand **)right {
    __block BOOL ret = false;
    __block CalculatorElement *tmpLeft = nil, *tmpRight = nil;
    [self.paramStack enumerateObjectsUsingBlock:^(CalculatorElement *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj elementType] == CalcElementTypeOperator) {
            if (idx < 2) {
                NSLog(@"Lack of operand.");
            } else {
                tmpLeft       = (CalculatorElement *)[self.paramStack objectAtIndex:idx-1];
                tmpRight      = (CalculatorElement *)[self.paramStack objectAtIndex:idx-2];
                if ([tmpLeft elementType] == CalcElementTypeOperand && [tmpRight elementType] == CalcElementTypeOperand) {
                    *operator   = (CalculatorOperator *)obj;
                    *left       = (CalculatorOperand *)tmpLeft;
                    *right      = (CalculatorOperand *)tmpRight;
                    *id         = idx;
                    ret         = true;
                } else {
                    NSLog(@"Error elementType, Two operand needed. left:%@, right:%@", tmpLeft, tmpRight);
                }
            }
            *stop       = 1;
        }
    }];
    
    return ret;
}

-(NSString *)calculatorWithError:(NSError **)error{
	CalculatorOperator *operator = nil;
    CalculatorOperand *left = nil;
    CalculatorOperand *right = nil;
    NSUInteger operatorIdx = 0;
	NSString *res = nil;
	
    while (([self nextOperator:&operator id:&operatorIdx leftOperand:&left rightOperand:&right])) {
		CalculatorOperand *resultOperand = [operator calculateWithLeftOperand:left rightOperand:right withError:error];
		if (*error) {
			NSLog(@"some thing wrong, stop calculating..");
			return nil;
		}
        NSLog(@"resultOperand:%@", resultOperand);
        [self.paramStack replaceObjectAtIndex:operatorIdx withObject:resultOperand];
        [self.paramStack removeObject:left];
        [self.paramStack removeObject:right];
	}
	res = ((CalculatorOperand *)[self.paramStack firstObject]).value;
	return [self resultTrim:res];
}

-(NSString *)calculateWithExpression:(nonnull NSString *)expression withError:(NSError **)error {
	[self.paramStack removeAllObjects];
	[self.tmpStack removeAllObjects];
    NSString *exp = expression;
    
    if ([expression characterAtIndex:0] == '-')
        exp = [NSString stringWithFormat:@"0%@", expression];
	[self parseWithExpression:exp withError:error];
	if (*error) {
		NSLog(@"parse expression faild.");
		return nil;
	}
	return [self calculatorWithError:error];
}

@end
