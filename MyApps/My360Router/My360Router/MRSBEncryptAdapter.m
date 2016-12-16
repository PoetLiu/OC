//
//  MRSBEncryptAdapter.m
//  My360Router
//
//  Created by liupeng on 16/10/18.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "MRSBEncryptAdapter.h"
#import "MRError.h"

@implementation MRSBEncryptAdapter

+ (void)getEncryptData:(NSArray *)data ByKeySuccess:(void (^)(id result))success failure:(void (^)(MRError *error))failure
{
	//1）获取randomkey
	/*
	QHSRCGIRandKeyCommand *randkeyCommand = [[QHSRCGIRandKeyCommand alloc] init];
	[[QHSRServiceDispacher shareInstance] sendCommand:randkeyCommand afterParseJson:[[QHSRCGIRandKeyParser alloc] init] reqSuccess:^(id result) {
		if ([result length] == 0) {
			if (failure) {
				failure([QHSRError errWithType:RouterError code:RouterError_Default msg:RouterError_Default_Msg sourceError:nil]);
			}
		}
		
		//2)randomkey没问题，就开始加密
		NSString *randKey = result;
		
		NSString *index = [randKey substringToIndex:32];
		NSString *key = [randKey substringFromIndex:32];
		
		NSMutableArray *encryptResultData = [[NSMutableArray alloc] init];
		
		for (NSString *needEncryptStr in data) {
			NSString *encryptStr = [QHSRCommonUtility encryptString:needEncryptStr withKey:key];
			NSString *finalStr = [NSString stringWithFormat:@"%@%@",index,encryptStr];
			[encryptResultData addObject:finalStr];
		}
		
		if (success) {
			success(encryptResultData);
		}
	} reqFailure:^(MRError *error) {
		if (failure) {
			failure(error);
		}
	}];*/
}

+ (void)getDecryptData:(NSArray *)data ByKeySuccess:(void (^)(id result))success failure:(void (^)(MRError *error))failure
{
	NSString *firstEncryptStr = [data objectAtIndex:0];
	NSString *index = [firstEncryptStr substringToIndex:32];
	/*
	QHSRCGIRandKeyCommand *randkeyCommand = [[QHSRCGIRandKeyCommand alloc] init];
	randkeyCommand.key_index = index;
	
	[[QHSRServiceDispacher shareInstance] sendCommand:randkeyCommand afterParseJson:[[QHSRCGIRandKeyParser alloc] init] reqSuccess:^(id result) {
		if ([result length] == 0) {
			if (failure) {
				failure([QHSRError errWithType:RouterError code:RouterError_Default msg:RouterError_Default_Msg sourceError:nil]);
			}
		}
		NSString *key = [result substringFromIndex:32];
		NSMutableArray *decryptData = [[NSMutableArray alloc] initWithCapacity:data.count];
		for (NSString *encryptStr in data) {
			NSString *encryptData = [encryptStr substringFromIndex:32];
			NSString *decryptStr = [QHSRCommonUtility decryptString:encryptData withKey:key];
			[decryptData addObject:decryptStr];
		}
		if (success) {
			success(decryptData);
		}
	} reqFailure:^(MRError *error) {
		NSLog(@"err:%@",error.sourceError.description);
		if (failure) {
			failure(error);
		}
	}];
	 */
}
@end
