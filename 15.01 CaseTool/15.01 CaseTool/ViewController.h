//
//  ViewController.h
//  15.01 CaseTool
//
//  Created by liupeng on 16/3/4.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultsField;
- (IBAction)uppercase;
- (IBAction)lowercase;

@end

