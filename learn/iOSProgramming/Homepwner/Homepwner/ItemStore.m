//
//  ItemStore.m
//  Homepwner
//
//  Created by liupeng on 16/3/25.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ItemStore.h"

@implementation ItemStore

-(id)init {
	if (self = [super init]) {
		self.allItems	= [[NSMutableArray alloc] init];
	}
	return (self);
}

-(Item *)createItem {
	Item *newItem	= [[Item alloc] initByRandom:YES];
	[self.allItems addObject:newItem];
	return newItem;
}

-(void)removeItem:(Item *)item {
	[self.allItems removeObject:item];
}

-(void)moveItemAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
	if (fromIndex == toIndex)
		return;
	Item * movedItem = [self.allItems objectAtIndex:fromIndex];
	[self.allItems removeObjectAtIndex:fromIndex];
	[self.allItems insertObject:movedItem atIndex:toIndex];
}
@end
