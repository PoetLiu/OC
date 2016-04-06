//
//  PhotosViewController.h
//  Photorama
//
//  Created by liupeng on 16/4/5.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStore.h"

@interface PhotosViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) PhotoStore *store;
@end
