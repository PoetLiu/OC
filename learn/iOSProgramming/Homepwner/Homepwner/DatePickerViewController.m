//
//  datePickerViewController.m
//  Homepwner
//
//  Created by liupeng on 16/4/28.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@end

@implementation DatePickerViewController

-(void)loadView {
	UIDatePicker *datePicker	= [[UIDatePicker alloc] init];
	datePicker.datePickerMode	= UIDatePickerModeDateAndTime;
	datePicker.backgroundColor	= [UIColor whiteColor];
	[datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
	datePicker.date	= self.item.dateCreated;
	self.datePicker	= datePicker;
	self.view	= datePicker;
}

-(void)dateChanged {
	self.item.dateCreated	= self.datePicker.date;
}

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


@end
