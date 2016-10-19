//
//  MRError.h
//  My360Router
//
//  Created by liupeng on 16/10/18.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	RouterError = 1,   //服务端错误,路由器没有绑定
	SystemError = 2,   //系统层错误,比如网路无法连接
	ArchiError  = 3,   //架构层异常错误,比如json解析失败
}ErrorType;


typedef enum{
	RouterErrorSource_None		= 0,
	RouterErrorSource_Local		= 1,
	RouterErrorSource_Remote	= 2,
} RouterErrorSource;

@interface MRError : NSObject
@property (nonatomic,copy)   NSString   *errorMsg;
@property (nonatomic,assign) NSInteger  errorCode;
@property (nonatomic,assign) ErrorType  type;
@property (nonatomic,strong) NSError    *sourceError;
@property (nonatomic,assign) RouterErrorSource routerErrorSource;


- (MRError *)initWithType:(ErrorType)type code:(NSInteger)code msg:(NSString *)msg sourceError:(NSError *)error;

+ (instancetype)errWithType:(ErrorType)type code:(NSInteger)code msg:(NSString *)msg sourceError:(NSError *)error;

/**
 *  判断错误是否在底层拦截
 *
 *  @return 返回是否
 */
- (BOOL)errorHasProcess;
@end
