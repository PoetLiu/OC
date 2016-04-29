//
//  CalculatorDataSource.h
//  Calculator
//
//  Created by liupeng on 16/4/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorDataSource : NSObject <UICollectionViewDataSource>
@property (strong, nonatomic) NSArray *buttonLabels;
@end
