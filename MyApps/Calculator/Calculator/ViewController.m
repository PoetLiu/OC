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
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat buttonWidth;
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
	
    kButtonEqual,
	kButtonClear
} kButtonId;

@implementation ViewController

static const NSInteger BUTTON_SPACE_VERTICAL = 1.0f;
static const NSInteger BUTTON_SPACE_HORIZONTAL = 1.0f;

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
		case 'C':
			return kButtonClear;
    }
    return kButtonUnkown;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_screenHeight	= [UIScreen mainScreen].bounds.size.height;
	_screenWidth	= [UIScreen mainScreen].bounds.size.width;
	_buttonHeight	= _screenHeight/7.0;
	_buttonWidth	= _screenWidth/4.0;
	self.resultField	= [[UITextField alloc] init];
	_resultField.placeholder	= @"0";
	_resultField.userInteractionEnabled	= NO;
	_resultField.textAlignment	= NSTextAlignmentRight;
	_resultField.font	= [UIFont systemFontOfSize:60];
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
							@"0", @".",	@".", @"/",
							@"=", @"=", @"=", @"C"];
	
	for (NSInteger i = 0; i < self.buttonLables.count; i++) {
		NSString *label	= [self.buttonLables objectAtIndex:i];
		NSInteger width = 1, height = 1;
		switch ([label characterAtIndex:0]) {
			case '.':
				width	= 2;
				break;
			case '=':
				width	= 3;
				break;
			default:
				break;
		}
        [self addButtonWithTitle:label row:i%4 line:i/4 width:width height:height];
	}
}


- (void)addButtonWithTitle:(NSString *)title row:(NSInteger)row line:(NSInteger)line width:(NSInteger)width height:(NSInteger)height {
	for (UIButton *b in _buttons) {
		if ([title isEqualToString:[b titleForState:UIControlStateNormal]]) {
			return;
		}
	}
    UIButton *new   = [UIButton buttonWithType:UIButtonTypeSystem];
	
    if (title) {
        [new setTitle:title forState:UIControlStateNormal];
        new.tag     = [self buttonIdWithLabel:title];
    }
	new.backgroundColor	= [UIColor lightGrayColor];
	new.titleLabel.font = [UIFont systemFontOfSize:60];
	if (_buttons == nil) {
		self.buttons	= [[NSMutableArray alloc] init];
	}
	[new addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
	[_buttons addObject:new];
	[self.view addSubview:new];
	new.translatesAutoresizingMaskIntoConstraints	= NO;
	[new.topAnchor constraintEqualToAnchor:_resultField.bottomAnchor constant:line*_buttonHeight].active	= YES;
	[new.leadingAnchor constraintEqualToAnchor:_resultField.leadingAnchor constant:row*_buttonWidth].active	= YES;
	[new.heightAnchor constraintEqualToConstant:_buttonHeight*height-BUTTON_SPACE_VERTICAL].active	= YES;
	[new.widthAnchor constraintEqualToConstant:_buttonWidth*width-BUTTON_SPACE_HORIZONTAL].active	= YES;
}

-(void)buttonPressed:(id)sender {
	switch ([sender tag]) {
		case kButtonZero:
		case kButtonOne:
		case kButtonTwo:
		case kButtonThree:
		case kButtonFour:
		case kButtonFive:
		case kButtonSix:
		case kButtonSeven:
		case kButtonEight:
		case kButtonNine:
		case kButtonDot:
		case kButtonAdd:
		case kButtonSub:
		case kButtonMultiply:
		case kButtonDivide:
			self.resultField.text	= [self.resultField.text stringByAppendingString:[sender titleForState:UIControlStateNormal]];
			break;
		case kButtonEqual:
			self.resultField.text	= [Calculator calculateWithExpression:self.resultField.text];
			break;
		case kButtonClear:
			self.resultField.text	= nil;
			break;
	}
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
