//
//  Line.h
//  TouchTracker
//
//  Created by liupeng on 16/3/31.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Line : NSObject
@property CGPoint begin;
@property CGPoint end;
- (id) initWithBegin:(CGPoint)begin end:(CGPoint)end;
@end
