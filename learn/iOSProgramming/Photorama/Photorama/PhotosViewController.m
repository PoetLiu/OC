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
	[self.store fetchRecentPhotos:^(NSMutableArray *photos) {
		if (photos) {
			NSLog(@"Successfully found %lu recent photos", (unsigned long)photos.count);
			Photo *photo = [photos firstObject];
			[self.store fetchImageForPhoto:photo completion:^(UIImage *image) {
				if (image) {
					[[NSOperationQueue mainQueue] addOperationWithBlock:^{
						self.imageView.image	= image;
					}];
				} else {
					NSLog(@"Error downloading image");
				}
			}];
		} else {
			NSLog(@"Error fetching recent Photos");
		}
	}];
	NSLog(@"done");
}
@end
