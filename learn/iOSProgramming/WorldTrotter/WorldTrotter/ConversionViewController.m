//
//  ConversionViewController.m
//  WorldTrotter
//
//  Created by liupeng on 16/3/22.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ConversionViewController.h"

@interface ConversionViewController ()
@end

@implementation ConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)fahrenheitFieldEditingChanged:(id)sender {
	NSString *text	= ((UITextField *)sender).text;
	if ([text length]) {
		CGFloat celsiusValue	= (float)([text floatValue] - 32.0f) * (5.0f/9.0f);
		self.celsiusLabel.text	= [NSString stringWithFormat:@"%.2f", celsiusValue];
	} else {
		self.celsiusLabel.text	= @"???";
	}

}
- (IBAction)dismissKeyboard:(id)sender {
	[self.textField resignFirstResponder];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	// Avoid input "." more than once.
	if ([string rangeOfString:@"."].length && [textField.text rangeOfString:@"."].length) {
		return NO;
	} else {
		return YES;
	}
}
@end
