//
//  ImageStore.h
//  Homepwner
//
//  Created by liupeng on 16/3/30.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageStore : NSObject
@property (strong, nonatomic) NSCache *cache;
- (void) setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *) imageForKey:(NSString *)key;
- (void) deleteImageForKey:(NSString *)key;
@end
