//
//  DetailViewController.h
//  Homepwner
//
//  Created by liupeng on 16/3/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *serialNumberField;
@property (strong, nonatomic) IBOutlet UITextField *valueField;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) Item *item;
@end
