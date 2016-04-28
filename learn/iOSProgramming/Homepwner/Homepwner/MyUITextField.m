//
//  MyUITextField.m
//  Homepwner
//
//  Created by liupeng on 16/4/28.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "MyUITextField.h"

@implementation MyUITextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)becomeFirstResponder {
	[super becomeFirstResponder];
	self.borderStyle	= UITextBorderStyleBezel;
	return YES;
}

-(BOOL)resignFirstResponder {
	[super resignFirstResponder];
	self.borderStyle	= UITextBorderStyleRoundedRect;
	return YES;
}

@end
