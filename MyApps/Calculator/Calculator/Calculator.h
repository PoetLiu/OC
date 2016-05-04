//
//  Calculator.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
+(NSString * _Nullable)calculateWithExpression:(nonnull NSString *)expression;
+(NSArray *_Nullable)parseWithExpression:(nonnull NSString *)expression;
@end
