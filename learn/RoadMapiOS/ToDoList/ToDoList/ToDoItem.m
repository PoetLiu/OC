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
- (id) init
{
    if (self = [super init]) {
        _creationDate = [NSDate date];
        NSLog(@"hello %@", _creationDate);
    }
    return (self);
}

- (void) encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.itemName forKey:@"itemName"];
	[coder encodeBool:self.completed forKey:@"completed"];
	[coder encodeObject:self.creationDate forKey:@"creationDate"];
	[coder encodeObject:self.imgName forKey:@"imgName"];
}

- (id) initWithCoder:(NSCoder *)decoder
{
	if (self = [super init]) {
		self.itemName	= [decoder decodeObjectForKey:@"itemName"];
		self.completed	= [decoder decodeBoolForKey:@"completed"];
		_creationDate	= [decoder decodeObjectForKey:@"creationDate"];
		self.imgName	= [decoder decodeObjectForKey:@"imgName"];
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
