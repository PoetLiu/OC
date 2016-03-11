//
//  ToDoListTableViewController.h
//  ToDoList
//
//  Created by liupeng on 16/3/9.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoListTableViewController : UITableViewController
- (IBAction)editButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButtonItem;
- (IBAction)unwindToList:(UIStoryboardSegue *) segue;
@end
