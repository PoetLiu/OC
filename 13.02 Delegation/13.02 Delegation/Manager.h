//
//  Manager.h
//  13.02 Delegation
//
//  Created by liupeng on 16/3/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Worker.h"

@interface Manager : NSObject
@property id<Worker> delegate;
- (void) doWork;
@end

