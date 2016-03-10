//
//  ToDoItem.m
//  ToDoList
//
//  Created by liupeng on 16/3/10.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ToDoItem.h"

@interface ToDoItem ()
@property NSDate *completionDate;
@end

@implementation ToDoItem
- (void) markAsCompleted:(BOOL)isComplete
{
	self.completed	= isComplete;
	[self setCompletionDate];
}
 - (void) setCompletionDate
{
	if (self.completed) {
		self.completionDate	= [NSDate date];
	} else {
		self.completionDate	= nil;
	}
}
@end
