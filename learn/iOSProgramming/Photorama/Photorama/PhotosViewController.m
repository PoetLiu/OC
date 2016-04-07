//
//  PhotosViewController.m
//  Photorama
//
//  Created by liupeng on 16/4/5.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "PhotosViewController.h"

@implementation PhotosViewController
/*
 https://69.147.76.173/services/rest/?method=flickr.photos.getRecent&api_key=a6d819499131071f158fd740860a5a88&extras=url_h,date_taken&format=json&nojsoncallback=1
 */
-(void)viewDidLoad {
	[super viewDidLoad];
    self.photoDataSource    = [[PhotoDataSource alloc] init];
    self.collectionView.dataSource  = self.photoDataSource;
    self.collectionView.delegate    = self;
	[self.store fetchRecentPhotos:^(NSMutableArray *photos) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (photos) {
                self.photoDataSource.photos = photos;
                NSLog(@"Successfully found %lu recent photos", (unsigned long)photos.count);
            } else {
                [self.photoDataSource.photos removeAllObjects];
                NSLog(@"Error fetching recent Photos");
            }
            [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        }];
	}];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    Photo *photo = self.photoDataSource.photos[indexPath.row];
    [self.store fetchImageForPhoto:photo completion:^(UIImage *image) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // The index path for the photo might have changed between the
            // time the request started and finished, so find the most recent
            // index path
            NSInteger photoIndex = [self.photoDataSource.photos indexOfObject:photo];
            NSIndexPath *photoIndexPath = [NSIndexPath indexPathForRow:photoIndex inSection:0];
            
            // when the request finishes, only update the cell if it's still visible
            PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:photoIndexPath];
            [cell updateWithImage:photo.image];
        }];
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"ShowPhoto"]) {
		NSIndexPath *selectedIndexPath = [self.collectionView.indexPathsForSelectedItems firstObject];
		Photo *photo = self.photoDataSource.photos[selectedIndexPath.row];
		PhotoInfoViewController *destinationVC = segue.destinationViewController;
		destinationVC.photo	= photo;
		destinationVC.store	= self.store;
	}
}
@end
