//
//  MRCommonUtility.h
//  My360Router
//
//  Created by liupeng on 16/10/18.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRCommonUtility : NSObject
+ (NSString *)encryptString:(NSString *)str withKey:(NSString *)encryptKey;
+ (NSString *)decryptString:(NSString *)str withKey:(NSString *)decryptKey;
@end
