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
- (void) encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.itemName forKey:@"itemName"];
	[coder encodeBool:self.completed forKey:@"completed"];
	[coder encodeObject:self.creationDate forKey:@"creationDate"];
}

- (id) initWithCoder:(NSCoder *)decoder
{
	if (self = [super init]) {
		self.itemName	= [decoder decodeObjectForKey:@"itemName"];
		self.completed	= [decoder decodeBoolForKey:@"completed"];
		_creationDate	= [decoder decodeObjectForKey:@"creationDate"];
	}
	return (self);
}

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
