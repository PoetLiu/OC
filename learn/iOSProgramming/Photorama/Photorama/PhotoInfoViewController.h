//
//  PhotoInfoViewController.h
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"
#import "PhotoStore.h"

@interface PhotoInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) Photo *photo;
@property (strong, nonatomic) PhotoStore *store;
@end
