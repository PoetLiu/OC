//
//  ItemsViewController.h
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemStore.h"

@interface ItemsViewController : UITableViewController
@property (strong, nonatomic) ItemStore *itemStore;
- (IBAction)toggleEditingMode:(id)sender;
- (IBAction)addNewItem:(id)sender;
@end
