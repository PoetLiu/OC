//
//  DrawView.h
//  TouchTracker
//
//  Created by liupeng on 16/3/31.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"
@interface DrawView : UIView <UIGestureRecognizerDelegate>
@property (strong, nonatomic) NSMutableDictionary *currentLines;
@property (strong, nonatomic) NSMutableArray<__kindof Line *> *finishedLines;
@property NSInteger seletedIndex;
@property (strong, nonatomic) UIPanGestureRecognizer *panRecognizer;
@property IBInspectable UIColor *finishedLineColor;
@property IBInspectable UIColor *currentLineColor;
@property IBInspectable CGFloat lineThickness;
@end
