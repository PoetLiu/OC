//
//  ItemStore.h
//  Homepwner
//
//  Created by liupeng on 16/3/25.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface ItemStore : NSObject
@property NSMutableArray *allItems;
-(Item*) createItem;
-(void)removeItem:(Item *)item;
-(void)moveItemAtIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end
