//
//  CalculatorDataSource.m
//  Calculator
//
//  Created by liupeng on 16/4/29.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "CalculatorDataSource.h"
#import "buttonCollectionViewCell.h"

static NSString *identifier = @"cellButton";

@implementation CalculatorDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	self. buttonLabels = @[
					 @"9", @"8", @"7", @"+",
					 @"6", @"5", @"4", @"-",
					 @"3", @"2", @"1", @"*",
					 @"0", @".", @"", @"/"];
	return [self.buttonLabels count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%@", indexPath);
	buttonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
	cell.buttonLabel.text	= [self.buttonLabels objectAtIndex:indexPath.row];
	cell.buttonLabel.textColor = [UIColor blackColor];
	cell.backgroundColor	= [UIColor lightGrayColor];
	return cell;
}
@end
