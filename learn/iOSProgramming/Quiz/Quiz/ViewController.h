//
//  ViewController.h
//  Quiz
//
//  Created by liupeng on 16/3/21.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *currentQuestionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *currentQuestionLabelCenterXConstraint;

@property (weak, nonatomic) IBOutlet UILabel *nextQuestionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nextQuestionLabelCenterXConstraint;

@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

- (IBAction)showNextQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;
@end

