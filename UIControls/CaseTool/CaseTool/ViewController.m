//
//  ViewController.m
//  CaseTool
//
//  Created by liupeng on 16/3/14.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.resultsField.text	= @"Results";
	self.textField.text	= @"Enter text here";
	[self.upperCaseButtonItem.layer setCornerRadius:10.0f];
	[self.lowerCaseButtonItem.layer setCornerRadius:10.0f];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)textFieldEditDidBegin:(id)sender {
	if ([self.textField.text isEqualToString:@"Enter text here"]) {
		[self.textField setText:nil];
	}
}

- (IBAction)textFieldEditDidEnd:(id)sender {
	if (self.textField.text == nil) {
		[self.textField setText:@"Enter text here"];
	}
}

- (IBAction)upperCaseAction:(id)sender {
	NSString *result	= [self.textField.text uppercaseString];
	[self.resultsField setText:result];
}

- (IBAction)lowerCaseAction:(id)sender {
	NSString *result	= [self.textField.text lowercaseString];
	[self.resultsField setText:result];
}
@end
