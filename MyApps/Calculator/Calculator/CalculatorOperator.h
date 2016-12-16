//
//  CalculatorOprator.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorElement.h"
#import "CalculatorOperand.h"

typedef NS_ENUM(NSInteger, CalcOperatorType) {
	CalcOperatorTypeErr = -1,
	CalcOperatorTypePlus,
	CalcOperatorTypeMinus,
	CalcOperatorTypeMultiply,
	CalcOperatorTypeDivide
};

typedef NS_ENUM(NSUInteger, CalcOperatorPriority) {
	CalcOperatorPriorityNormal,
	CalcOperatorPriorityHigh,
};

@interface CalculatorOperator : CalculatorElement
@property (nonatomic, assign) CalcOperatorType operatorType;
@property (nonatomic, assign) CalcOperatorPriority priority;
+(BOOL)characterIsOperator:(unichar)c;
+(CalcOperatorType)characterOperatorType:(unichar)c;
-(instancetype)initWithOperatorType:(CalcOperatorType)type;
-(CalculatorOperand*) calculateWithLeftOperand:(CalculatorOperand *)left
								  rightOperand:(CalculatorOperand *)right
									 withError:(NSError **)err;
@end
