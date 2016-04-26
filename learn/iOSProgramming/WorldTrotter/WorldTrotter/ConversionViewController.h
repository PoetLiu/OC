//
//  ConversionViewController.h
//  WorldTrotter
//
//  Created by liupeng on 16/3/22.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConversionViewController : UIViewController <UITextFieldDelegate>

- (IBAction)fahrenheitFieldEditingChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UILabel *celsiusLabel;

- (IBAction)dismissKeyboard:(id)sender;
@end
