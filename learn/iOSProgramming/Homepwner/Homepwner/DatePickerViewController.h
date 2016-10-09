//
//  datePickerViewController.h
//  Homepwner
//
//  Created by liupeng on 16/4/28.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface DatePickerViewController : UIViewController
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) Item *item;
@end
