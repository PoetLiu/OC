//
//  ViewController.m
//  Quiz
//
//  Created by liupeng on 16/3/21.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "CustomItem.h"

@interface ViewController ()
@property (strong, nonatomic)NSMutableArray *data;
@property NSInteger currentQuestionIndex;
@end

@implementation ViewController

- (void)animateLabelTransitions {
	CGFloat screenWidth	= self.view.frame.size.width;
	self.nextQuestionLabelCenterXConstraint.constant	= 0;
	self.currentQuestionLabelCenterXConstraint.constant	+= screenWidth;
	
	void(^animationBlock)(void)	= ^(void) {
		self.currentQuestionLabel.alpha	= 0;
		self.nextQuestionLabel.alpha	= 1;
		[self.view layoutIfNeeded];
		NSLog(@"Hello");
	};
	[UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionAllowAnimatedContent animations:animationBlock completion:^(BOOL in){
		UILabel *tmp = self.currentQuestionLabel;
		self.currentQuestionLabel	= self.nextQuestionLabel;
		self.nextQuestionLabel		= tmp;
		
		NSLayoutConstraint *tmp1	= self.currentQuestionLabelCenterXConstraint;
		self.currentQuestionLabelCenterXConstraint	= self.nextQuestionLabelCenterXConstraint;
		self.nextQuestionLabelCenterXConstraint		= tmp1;
		[self updateOffScreenLabel];
		}];
}

- (void)updateQuestionLableText:(UILabel *)questionLabel {
	CustomItem *item	= self.data[self.currentQuestionIndex];
	questionLabel.text		= item.question;
}

- (void)updateAnswerLableText {
	CustomItem *item	= self.data[self.currentQuestionIndex];
	self.answerLabel.text		= item.answer;
}
- (void)initAnswerLableText {
	self.answerLabel.text = @"???";
}

- (void)initParam {
	self.data	= [[NSMutableArray alloc] init];
	CustomItem *item	= [[CustomItem alloc] initWithQuestion:@"From what is cognac made?" answer:@"Grapes"];
	[self.data addObject:item];
	item	= [[CustomItem alloc] initWithQuestion:@"What is 7+7?" answer:@"14"];
	[self.data addObject:item];
	item	= [[CustomItem alloc] initWithQuestion:@"What is the capital of Vermont?" answer:@"Montpelier"];
	[self.data addObject:item];
	
	self.currentQuestionIndex	= 0;
	[self updateQuestionLableText:self.currentQuestionLabel];
}
- (void)updateOffScreenLabel {
	CGFloat screenWidth	= self.view.frame.size.width;
	self.nextQuestionLabelCenterXConstraint.constant	= -screenWidth;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	[self initParam];
	[self updateOffScreenLabel];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.nextQuestionLabel.alpha	= 0;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)showNextQuestion:(id)sender {
	self.currentQuestionIndex++;
	if (self.currentQuestionIndex == self.data.count) {
		self.currentQuestionIndex	= 0;
	}
	[self updateQuestionLableText:self.nextQuestionLabel];
	[self initAnswerLableText];
	[self animateLabelTransitions];
}

- (IBAction)showAnswer:(id)sender {
	[self updateAnswerLableText];
}
@end
