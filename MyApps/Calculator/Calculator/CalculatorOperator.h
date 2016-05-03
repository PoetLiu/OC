//
//  CalculatorOprator.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorElement.h"
#import "CalculatorOperand.h"

typedef enum CalcOperatorType {
	CalcOperatorTypeErr = -1,
	CalcOperatorTypePlus,
	CalcOperatorTypeMinus,
	CalcOperatorTypeMultiply,
	CalcOperatorTypeDivide
}CalcOperatorType;

typedef enum CalcOperatorPriority {
	CalcOperatorPriorityNormal,
	CalcOperatorPriorityHigh,
}CalcOperatorPriority;

@interface CalculatorOperator : CalculatorElement
@property (nonatomic, assign) CalcOperatorType operatorType;
@property (nonatomic, assign) CalcOperatorPriority priority;
@property (nonatomic, assign) CalculatorOperand * (*calculate)(CalculatorOperand *left, CalculatorOperand *right);
+(BOOL)characterIsOperator:(unichar)c;
+(CalcOperatorType)characterOperatorType:(unichar)c;
-(instancetype)initWithOperatorType:(CalcOperatorType)type;
@end
