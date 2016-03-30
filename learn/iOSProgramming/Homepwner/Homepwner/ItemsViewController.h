//
//  ItemsViewController.h
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemStore.h"
#import "ItemCell.h"
#import "ImageStore.h"
#import "DetailViewController.h"
@interface ItemsViewController : UITableViewController
@property (strong, nonatomic) ItemStore *itemStore;
@property (strong, nonatomic) ImageStore *imageStore;
- (IBAction)addNewItem:(id)sender;
@end
