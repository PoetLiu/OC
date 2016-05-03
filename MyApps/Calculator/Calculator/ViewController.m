//
//  ViewController.m
//  Calculator
//
//  Created by liupeng on 16/4/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorDataSource.h"
#import "Calculator.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) CalculatorDataSource *dataSource;
@property (strong, nonatomic) IBOutlet UITextField *resultField;
- (IBAction)equalButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.dataSource	= [[CalculatorDataSource alloc] init];
	self.collectionView.dataSource	= self.dataSource;
	self.collectionView.delegate	= self;

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

-(void)equalButton:(id)sender {
	NSString *result = [Calculator calculateWithExpression:self.resultField.text];
	if (result) {
		self.resultField.text = result;
	}
}

- (void)calculatorAppendCharacter:(NSString *)character {
	self.resultField.text =  [self.resultField.text stringByAppendingString:character];
}

- (void)clearAllResult {
	self.resultField.text = [NSString string];
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSString *labels = [self.dataSource.buttonLabels objectAtIndex:indexPath.row];
	if ([labels isEqualToString:@"C"]) {
		[self clearAllResult];
		return;
	}
	[self calculatorAppendCharacter:labels];
}

@end
