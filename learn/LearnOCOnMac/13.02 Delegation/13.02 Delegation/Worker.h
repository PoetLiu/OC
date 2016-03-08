//
//  Woker.h
//  13.02 Delegation
//
//  Created by liupeng on 16/3/3.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Worker <NSObject>
@required
- (void) doSomeRequiredWork;
@optional
- (void) doSomeOptionalWork;
@end
