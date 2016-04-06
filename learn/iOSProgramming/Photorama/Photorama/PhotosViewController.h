//
//  PhotosViewController.h
//  Photorama
//
//  Created by liupeng on 16/4/5.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStore.h"
#import "PhotoDataSource.h"
#import "PhotoCollectionViewCell.h"

@interface PhotosViewController : UIViewController <UICollectionViewDelegate>
@property (strong, nonatomic) PhotoStore *store;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) PhotoDataSource *photoDataSource;
@end
