//
//  Calculator.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
+(NSString *)calculateWithExpression:(NSString *)expression withError:(NSError **)error;
+(NSArray *)parseWithExpression:(NSString *)expression;
@end
