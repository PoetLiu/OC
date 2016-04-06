//
//  PhotoDataSource.h
//  Photorama
//
//  Created by liuPeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewCell.h"
#import "PhotoStore.h"

@interface PhotoDataSource : NSObject <UICollectionViewDataSource>
@property (strong, nonatomic) NSMutableArray<__kindof Photo*> *photos;
@end
