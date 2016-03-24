//
//  Item.m
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "Item.h"

@implementation Item
- (id) initWithName:(NSString *)name serialNumber:(NSString *)sn valueInDollars:(NSInteger)value {
	if (self = [super init]) {
		self.name	= name;
		self.valueInDollars	= value;
		self.serialNumber	= sn;
		self.dateCreated	= [NSDate date];
	}
	return (self);
}

- (id) initByRandom:(BOOL)random {
	if (random) {
		NSArray *adjectives = [[NSArray alloc] initWithObjects:@"Fluffy", @"Rustry", @"Shiny", nil];
		NSArray *nouns	= [[NSArray alloc] initWithObjects:@"Bear", @"Spork", @"Mac", nil];
	}
	return self;
}
@end
