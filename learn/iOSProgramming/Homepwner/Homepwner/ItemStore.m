//
//  ItemStore.m
//  Homepwner
//
//  Created by liupeng on 16/3/25.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@implementation ItemStore

-(id)init {
	if (self = [super init]) {
		NSArray *documentsDirectories = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
		NSURL *documentDirectory = [documentsDirectories firstObject];
		self.itemArchiveURL	= [documentDirectory URLByAppendingPathComponent:@"items.archive"];
		
		if ((self.allItems = [NSKeyedUnarchiver unarchiveObjectWithFile:self.itemArchiveURL.path]) == nil) {
			self.allItems	= [[NSMutableArray alloc] init];
		}
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

- (BOOL)saveChanges {
	NSLog(@"Saving items to %@", self.itemArchiveURL.path);
	return [NSKeyedArchiver archiveRootObject:self.allItems toFile:self.itemArchiveURL.path];
}
@end
