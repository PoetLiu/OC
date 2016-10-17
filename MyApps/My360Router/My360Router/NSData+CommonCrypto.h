//
//  NSData+CommonCrypto.h
//  My360Router
//
//  Created by liuPeng on 2016/10/17.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSData.h>
#import <Foundation/NSError.h>
#import <CommonCrypto/CommonCryptor.h>


@interface NSData (LowLevelCommonCryptor)
- (NSData *) QHSRDataEncryptedUsingAlgorithm: (CCAlgorithm) algorithm
                                         key: (id) key		// data or string
                        initializationVector: (id) iv		// data or string
                                     options: (CCOptions) options
                                       error: (CCCryptorStatus *) error;
- (NSData *) QHSRDecryptedDataUsingAlgorithm: (CCAlgorithm) algorithm
                                         key: (id) key		// data or string
                        initializationVector: (id) iv		// data or string
                                     options: (CCOptions) options
                                       error: (CCCryptorStatus *) error;
@end
