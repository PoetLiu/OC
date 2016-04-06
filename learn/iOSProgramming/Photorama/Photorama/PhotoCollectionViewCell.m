//
//  PhotoCollectionViewCell.m
//  Photorama
//
//  Created by liuPeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell
- (void) updateWithImage:(UIImage *)image {
    if (image) {
        [self.spinner stopAnimating];
        self.imageView.image    = image;
    } else {
        [self.spinner startAnimating];
        self.imageView.image    = nil;
    }
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self updateWithImage:nil];
}

-(void)prepareForReuse {
    [super prepareForReuse];
    [self updateWithImage:nil];
}
@end
