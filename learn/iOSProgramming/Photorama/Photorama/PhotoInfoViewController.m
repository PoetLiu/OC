//
//  PhotoInfoViewController.m
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "PhotoInfoViewController.h"

@implementation PhotoInfoViewController
-(void)viewDidLoad {
	[super viewDidLoad];
	[self.store fetchImageForPhoto:self.photo completion:^(UIImage *image) {
		if (image) {
			[[NSOperationQueue mainQueue] addOperationWithBlock:^{
				self.imageView.image	= image;
			}];
		} else {
			NSLog(@"Error fetch image for photo");
		}
	}];
}
@end
