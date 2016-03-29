//
//  DetailViewController.m
//  Homepwner
//
//  Created by liupeng on 16/3/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.nameField.text 	= self.item.name;
	self.serialNumberField.text	= self.item.serialNumber;
	self.valueField.text	= [[NSString alloc] initWithFormat:@"%ld", (long)self.item.valueInDollars];
	self.dateLabel.text		= [[NSString alloc] initWithFormat:@"%@", self.item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Save change to item
    self.item.name  = self.nameField.text;
    self.item.serialNumber  = self.serialNumberField.text;
    NSInteger value = [self.valueField.text integerValue];
    if (value > 0) {
        self.item.valueInDollars    = value;
    } else {
        self.item.valueInDollars    = 0;
    }

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
