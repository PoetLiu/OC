//
//  AddToDoItemViewController.h
//  ToDoList
//
//  Created by liupeng on 16/3/9.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoItem.h"

@interface AddToDoItemViewController : UIViewController

@property ToDoItem *toDoItem;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end
