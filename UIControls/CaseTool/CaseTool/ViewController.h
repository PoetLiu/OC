//
//  ViewController.h
//  CaseTool
//
//  Created by liupeng on 16/3/14.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultsField;
- (IBAction)textFieldEditDidBegin:(id)sender;
- (IBAction)textFieldEditDidEnd:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *upperCaseButtonItem;
@property (weak, nonatomic) IBOutlet UIButton *lowerCaseButtonItem;

- (IBAction)upperCaseAction:(id)sender;
- (IBAction)lowerCaseAction:(id)sender;

@end

