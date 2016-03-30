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
		self.itemKey		= [[NSUUID UUID] UUIDString];
	}
	return (self);
}

- (id) initByRandom:(BOOL)random {
	if (random) {
		NSArray *adjectives = [[NSArray alloc] initWithObjects:@"Fluffy", @"Rustry", @"Shiny", nil];
		NSArray *nouns	= [[NSArray alloc] initWithObjects:@"Bear", @"Spork", @"Mac", nil];
		
		uint32_t idx	= arc4random_uniform((uint32_t)[adjectives count]);
		NSString *randomAdjective	= adjectives[idx];
		
		idx	= arc4random_uniform((uint32_t)[nouns count]);
		NSString *randomNoun	= nouns[idx];
		
		NSString *randomName	= [[randomAdjective stringByAppendingString:@" " ] stringByAppendingString: randomNoun];
		NSInteger randomValue	= arc4random_uniform(100);
		NSString *randomSerialNumber	= [[[[NSUUID UUID] UUIDString] componentsSeparatedByString:@"-"] firstObject];
		
		return [self initWithName:randomName serialNumber:randomSerialNumber valueInDollars:randomValue];
	} else {
		return [self initWithName:@"" serialNumber:nil valueInDollars:0];
	}

}

- (id)initWithCoder:(NSCoder *)coder
{
	if (self = [super init]) {
		self.name	= [coder decodeObjectForKey:@"name"];
		self.dateCreated	= [coder decodeObjectForKey:@"dateCreated"];
		self.itemKey		= [coder decodeObjectForKey:@"itemKey"];
		self.serialNumber	= [coder decodeObjectForKey:@"serialNumber"];
		self.valueInDollars	= [coder decodeIntegerForKey:@"valueInDollars"];
	}

	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:self.name forKey:@"name"];
	[coder encodeObject:self.dateCreated forKey:@"dateCreated"];
	[coder encodeObject:self.itemKey forKey:@"itemKey"];
	[coder encodeObject:self.serialNumber forKey:@"serialNumber"];
	[coder encodeInteger:self.valueInDollars forKey:@"valueInDollars"];
}
@end
