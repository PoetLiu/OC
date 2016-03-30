//
//  Item.h
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject <NSCoding>
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *serialNumber;
@property (strong, nonatomic) NSDate *dateCreated;
@property (strong, nonatomic) NSString *itemKey;
@property NSInteger valueInDollars;

- (id) initWithName:(NSString *)name serialNumber:(NSString *)sn valueInDollars:(NSInteger)value;
- (id) initByRandom:(BOOL)random;
@end
