//
//  Item.h
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (strong, nonatomic, nonnull) NSString *name;
@property (strong, nonatomic, nullable) NSString *serialNumber;
@property (strong, nonatomic, nonnull) NSDate *dateCreated;
@property NSInteger valueInDollars;

- (id) initWithName:(NSString  * _Nonnull)name serialNumber:(NSString * _Nullable)sn valueInDollars:(NSInteger)value;
@end
