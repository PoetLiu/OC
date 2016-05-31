//
//  CalculatorElement.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CalcElementType) {
	CalcElementTypeOperand,
	CalcElementTypeOperator
};

@interface CalculatorElement : NSObject
@property (nonatomic, assign) CalcElementType elementType;
-(instancetype) initWithElementType:(CalcElementType)type;
@end
