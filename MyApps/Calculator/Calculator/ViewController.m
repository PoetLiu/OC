//
//  ViewController.m
//  Calculator
//
//  Created by liupeng on 16/4/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()
@property (nonatomic, strong) UITextField *resultField;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSArray *buttonLables;
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) CGFloat screenWidth;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_screenHeight = [UIScreen mainScreen].bounds.size.height;
	_screenWidth  = [UIScreen mainScreen].bounds.size.width;
	
	self.resultField	= [[UITextField alloc] init];
	_resultField.placeholder	= @"0";
	_resultField.userInteractionEnabled	= NO;
	_resultField.textAlignment	= NSTextAlignmentRight;
	_resultField.font	= [UIFont systemFontOfSize:60];
	_resultField.textColor	= [UIColor whiteColor];
	_resultField.backgroundColor = [UIColor lightGrayColor];
	_resultField.contentVerticalAlignment	= UIControlContentVerticalAlignmentBottom;
	_resultField.contentHorizontalAlignment	= UIControlContentHorizontalAlignmentRight;
	_resultField.translatesAutoresizingMaskIntoConstraints	= NO;
	[self.view addSubview:_resultField];
	[_resultField.topAnchor constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor]].active	= YES;
	[_resultField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active	= YES;
	[_resultField.heightAnchor constraintEqualToConstant:_screenHeight/7*2].active	= YES;
	
	self.buttonLables	= @[@"7", @"8", @"9", @"+",
							@"4", @"5", @"6", @"-",
							@"1", @"2", @"3", @"*",
							@"0", @".", @"=", @"/"];
	
	NSInteger buttonBaseY = _screenHeight/7*2;
	NSInteger buttonWidth = _screenWidth/4;
	NSInteger buttonHeight = _screenHeight/7;
	for (NSInteger i = 0; i < self.buttonLables.count; i++) {
		NSString *label	= [self.buttonLables objectAtIndex:i];
		[self addButtonWithTitle:label frame:CGRectMake((i%4)*buttonWidth, buttonBaseY+buttonHeight*(i/4), buttonHeight, buttonWidth) tag:i];
	}
	
}

- (void)addButtonWithTitle:(NSString *)title frame:(CGRect)frame tag:(NSInteger)tag{
	UIButton *new = [[UIButton alloc] initWithFrame:frame];
	new.tag	= tag;
	if (title) new.titleLabel.text	= title;
	new.titleLabel.font = [UIFont systemFontOfSize:60];
	new.titleLabel.textColor	= [UIColor whiteColor];
	new.backgroundColor	= [[UIColor blackColor] colorWithAlphaComponent:0.5];
	if (_buttons == nil) {
		self.buttons	= [[NSMutableArray alloc] init];
	}
	[_buttons addObject:new];
	[self.view addSubview:new];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
