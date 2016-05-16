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

typedef enum {
    kButtonUnkown,
    kButtonAdd,
    kButtonSub,
    kButtonDivide,
    kButtonMultiply,
    
    kButtonSeven,
    kButtonEight,
    kButtonNine,
    
    kButtonFour,
    kButtonFive,
    kButtonSix,
    
    kButtonOne,
    kButtonTwo,
    kButtonThree,
    
    kButtonZero,
    kButtonDot,
    kButtonEqual
} kButtonId;

@implementation ViewController

- (kButtonId) buttonIdWithLabel:(NSString *)label {
    unichar ch =  [label characterAtIndex:0];
    switch (ch) {
        case '0':
            return kButtonZero;
        case '1':
            return kButtonOne;
        case '2':
            return kButtonTwo;
        case '3':
            return kButtonThree;
        case '4':
            return kButtonFour;
        case '5':
            return kButtonFive;
        case '6':
            return kButtonSix;
        case '7':
            return kButtonSeven;
        case '8':
            return kButtonEight;
        case '9':
            return kButtonNine;
        case '.':
            return kButtonDot;
        case '+':
            return kButtonAdd;
        case '-':
            return kButtonSub;
        case '*':
            return kButtonMultiply;
        case '/':
            return kButtonDivide;
        case '=':
            return kButtonEqual;
    }
    return kButtonUnkown;
}

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
	for (NSInteger i = 0; i < self.buttonLables.count; i++) {
		NSString *label	= [self.buttonLables objectAtIndex:i];
        [self addButtonWithTitle:label row:i/4 line:i%4];
	}
}


- (void)addButtonWithTitle:(NSString *)title row:(NSInteger)row line:(NSInteger)line {
    UIButton *new   = [UIButton buttonWithType:UIButtonTypeSystem];
	
    if (title) {
        [new setTitle:title forState:UIControlStateNormal];
        new.tag     = [self buttonIdWithLabel:title];
    }
	new.titleLabel.font = [UIFont systemFontOfSize:60];
	new.titleLabel.textColor    = [UIColor whiteColor];
	new.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
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
