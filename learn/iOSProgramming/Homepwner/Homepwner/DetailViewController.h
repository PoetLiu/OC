//
//  DetailViewController.h
//  Homepwner
//
//  Created by liupeng on 16/3/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;
@class ImageStore;

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) Item *item;
@property (strong, nonatomic) ImageStore *imageStore;
@end
