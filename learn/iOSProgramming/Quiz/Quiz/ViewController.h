//
//  ViewController.h
//  Quiz
//
//  Created by liupeng on 16/3/21.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel *currentQuestionLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *currentQuestionLabelCenterXConstraint;

@property (nonatomic, weak) IBOutlet UILabel *nextQuestionLabel;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *nextQuestionLabelCenterXConstraint;

@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

- (IBAction)showNextQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;
@end

