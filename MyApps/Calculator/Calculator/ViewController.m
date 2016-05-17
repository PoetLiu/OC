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

@implementation ViewController

static const NSInteger BUTTON_SPACE_VERTICAL = 1.0f;
static const NSInteger BUTTON_SPACE_HORIZONTAL = 1.0f;

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
	[_resultField.topAnchor constraintEqualToAnchor:self.view.topAnchor].active	= YES;
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
			self.resultField.text	= [self.resultField.text stringByAppendingString:[sender titleForState:UIControlStateNormal]];
			break;
		case '=':
			self.resultField.text	= [Calculator calculateWithExpression:self.resultField.text];
			break;
		case 'C':
			self.resultField.text	= nil;
			break;
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
