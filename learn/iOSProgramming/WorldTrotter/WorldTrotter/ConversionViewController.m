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

- (NSDateComponents *)getNowDateComponents {
	NSDate *now	= [NSDate date];
	NSCalendar *current = [NSCalendar currentCalendar];
	NSDateComponents *nowDateComponents = [current components:(NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond) fromDate:now];
	NSLog(@"%ld:%ld:%ld", (long)nowDateComponents.hour, (long)nowDateComponents.minute, (long)nowDateComponents.second);
	return nowDateComponents;
	
}

- (UIColor *)getBackgroundColor {
	if ([self getNowDateComponents].hour >= 18) {
		return [UIColor darkGrayColor];
	} else {
		return [UIColor whiteColor];
	}
}

- (void)viewWillAppear:(BOOL)animated {
	[self.view setBackgroundColor:[self getBackgroundColor]];
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
	NSCharacterSet *characterSet = [NSCharacterSet letterCharacterSet];
	// NSLog(@"%@", decimalSeparator);
	// Avoid input "." more than once.
	if ([string rangeOfString:decimalSeparator].length && [textField.text rangeOfString:decimalSeparator].length) {
		return NO;
	} else if ([string rangeOfCharacterFromSet:characterSet].length) {
		return NO;
	} else {
		return YES;
	}
}
@end
