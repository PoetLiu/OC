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
@property NSMutableArray *data;
@property NSInteger currentQuestionIndex;
@end

@implementation ViewController

- (void)updateQuestionLableText {
	CustomItem *item	= self.data[self.currentQuestionIndex];
	self.questionLabel.text		= item.question;
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
	[self updateQuestionLableText];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initParam];
	// Do any additional setup after loading the view, typically from a nib.
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
	[self updateQuestionLableText];
	[self initAnswerLableText];
}

- (IBAction)showAnswer:(id)sender {
	[self updateAnswerLableText];
}
@end
