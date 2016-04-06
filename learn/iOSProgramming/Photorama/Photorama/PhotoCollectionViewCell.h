//
//  PhotoCollectionViewCell.h
//  Photorama
//
//  Created by liuPeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (void) updateWithImage:(UIImage *)image;
@end
