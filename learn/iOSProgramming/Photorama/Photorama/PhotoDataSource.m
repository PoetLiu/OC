//
//  PhotoDataSource.m
//  Photorama
//
//  Created by liuPeng on 16/4/6.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "PhotoDataSource.h"

@implementation PhotoDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photos count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"UICollectionViewCell";
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    Photo *photo = self.photos[indexPath.row];
    [cell updateWithImage:photo.image];
    return cell;
}
@end
