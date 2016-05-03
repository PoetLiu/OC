//
//  CalculatorOperand.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorElement.h"

@interface CalculatorOperand : CalculatorElement
@property (nonatomic, copy) NSString *value;
+(BOOL)characterIsOperand:(unichar)c;
-(instancetype)initWithValue:(NSString *)value;
@end
