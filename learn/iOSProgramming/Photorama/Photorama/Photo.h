//
//  Photo.h
//  Photorama
//
//  Created by liupeng on 16/4/7.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
@property (strong, nonatomic) UIImage *image;
@end

NS_ASSUME_NONNULL_END

#import "Photo+CoreDataProperties.h"
