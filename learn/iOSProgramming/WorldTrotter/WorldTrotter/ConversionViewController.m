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
	NSLog(@"ConversionViewController loaded its view");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)getUIColorByOrder {
	static	NSInteger	id = 0;
	switch (id++) {
		case 0:
			return [UIColor blueColor];
		case 1:
			return [UIColor whiteColor];
		case 2:
			return [UIColor grayColor];
		case 3:
			return [UIColor redColor];
		case 4:
			return [UIColor greenColor];
		default:
			id	= 0;
			return [self getUIColorByOrder];
	}
	return nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[self.view setBackgroundColor:[self getUIColorByOrder]];
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
	NSLocale *currentLocale	= [NSLocale currentLocale];
	NSString *decimalSeparator = [currentLocale objectForKey:NSLocaleDecimalSeparator];
	NSLog(@"%@", decimalSeparator);
	// Avoid input "." more than once.
	if ([string rangeOfString:decimalSeparator].length && [textField.text rangeOfString:decimalSeparator].length) {
		return NO;
	} else {
		return YES;
	}
}
@end
