//
//  ViewController.m
//  Calculator
//
//  Created by liupeng on 16/4/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import <AudioToolbox/AudioToolbox.h>

#define BTN_PRESS_SOUND_ID  1104

typedef NS_ENUM(NSUInteger, CalcStateType) {
	CalcStateNormal,
	CalcStateError
};

@interface ViewController ()
@property (nonatomic, strong) UITextField *resultField;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSArray *buttonLables;
@property (nonatomic, assign) CGFloat screenHeight;
@property (nonatomic, assign) CGFloat screenWidth;
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, assign) CalcStateType state;
@property (nonatomic, strong) Calculator *calculator;
@end

@implementation ViewController

static const NSInteger BUTTON_SPACE_VERTICAL = 1.0f;
static const NSInteger BUTTON_SPACE_HORIZONTAL = 1.0f;

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_calculator		= [[Calculator alloc] init];
	_screenHeight	= [UIScreen mainScreen].bounds.size.height;
	_screenWidth	= [UIScreen mainScreen].bounds.size.width;
	_buttonHeight	= _screenHeight/7.0;
	_buttonWidth	= _screenWidth/4.0;
	_state			= CalcStateNormal;
	self.resultField	= [[UITextField alloc] init];
	_resultField.placeholder	= @"0";
	_resultField.userInteractionEnabled	= NO;
	_resultField.textAlignment	= NSTextAlignmentRight;
	_resultField.font	= [UIFont systemFontOfSize:80];
	_resultField.contentVerticalAlignment	= UIControlContentVerticalAlignmentBottom;
	_resultField.contentHorizontalAlignment	= UIControlContentHorizontalAlignmentRight;
	_resultField.adjustsFontSizeToFitWidth = YES;
	_resultField.translatesAutoresizingMaskIntoConstraints	= NO;
	[self.view addSubview:_resultField];
	[_resultField.topAnchor constraintEqualToAnchor:self.view.topAnchor].active	= YES;
	[_resultField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active	= YES;
	[_resultField.heightAnchor constraintEqualToConstant:_screenHeight/7*2].active	= YES;
	
    self.buttonLables	= @[@"7", @"8", @"9", @"+",
							@"4", @"5", @"6", @"-",
							@"1", @"2", @"3", @"*",
							@"0", @"(",	@")", @"/",
							@".", @"C", @"=", @"="];
	
	for (NSInteger i = 0; i < self.buttonLables.count; i++) {
		NSString *label	= [self.buttonLables objectAtIndex:i];
		NSInteger width = 1, height = 1;
		switch ([label characterAtIndex:0]) {
			case '=':
				width	= 2;
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

-(void)voiceBtnPressPlay:(id)sender {
    AudioServicesPlaySystemSound(BTN_PRESS_SOUND_ID);
}

-(void)buttonPressed:(id)sender {
	NSError *error = nil;
	NSString *result = nil;
    [self voiceBtnPressPlay:self];
	if (self.state == CalcStateError) {
		self.resultField.text	= nil;
		self.state	= CalcStateNormal;
	}
	switch ([[sender titleForState:UIControlStateNormal] characterAtIndex:0]) {
		case '0':
		case '1':
		case '2':
		case '3':
		case '4':
		case '5':
		case '6':
		case '7':
		case '8':
		case '9':
		case '.':
		case '+':
		case '-':
		case '*':
		case '/':
		case '(':
		case ')':
			result	= [self.resultField.text stringByAppendingString:[sender titleForState:UIControlStateNormal]];
			break;
		case '=':
			result	= [self.calculator calculateWithExpression:self.resultField.text withError:&error];
			break;
		case 'C':
			result	= nil;
			break;
	}
	
	if (error) {
		NSLog(@"Error:%@", error);
		self.state				= CalcStateError;
		self.resultField.text	= @"error";
	} else {
		self.resultField.text	= result;
	}
	return;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
