//
//  AppDelegate.h
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemStore.h"
#import "ItemsViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ItemStore *itemStore;

@end

