//
//  CustomItem.h
//  Quiz
//
//  Created by liupeng on 16/3/21.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomItem : NSObject
@property NSString *question;
@property NSString *answer;
- (id) initWithQuestion: (NSString *)question answer:(NSString *)answer;
@end
