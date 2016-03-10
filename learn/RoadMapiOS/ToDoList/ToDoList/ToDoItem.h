//
//  ToDoItem.h
//  ToDoList
//
//  Created by liupeng on 16/3/10.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;
- (void) markAsCompleted: (BOOL) isComplete;
@end
