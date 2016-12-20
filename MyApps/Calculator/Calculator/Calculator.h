//
//  Calculator.h
//  Calculator
//
//  Created by liupeng on 16/5/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
-(nullable NSString *)calculateWithExpression:(nonnull NSString *)expression
						   withError:(NSError * _Nullable * _Nullable)error;
-(BOOL)parseWithExpression:(nonnull NSString *)expression
				 withError:(NSError * _Nullable * _Nullable)error;
@end
