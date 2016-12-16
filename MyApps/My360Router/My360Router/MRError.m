//
//  MRError.m
//  My360Router
//
//  Created by liupeng on 16/10/18.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "MRError.h"

@implementation MRError
+ (instancetype)errWithType:(ErrorType)type code:(NSInteger)code msg:(NSString *)msg sourceError:(NSError *)error
{
	return [[self alloc] initWithType:type code:code msg:msg sourceError:error];
}

- (id)initWithType:(ErrorType)type code:(NSInteger)code msg:(NSString *)msg sourceError:(NSError *)error
{
	self = [super init];
	if (self) {
		self.type = type;
		self.errorCode = code;
		self.errorMsg = msg;
		self.sourceError = error;
	}
	return self;
}


- (BOOL)errorHasProcess
{
	return NO;
}
@end
