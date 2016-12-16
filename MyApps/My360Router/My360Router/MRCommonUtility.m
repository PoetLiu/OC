//
//  MRCommonUtility.m
//  My360Router
//
//  Created by liupeng on 16/10/18.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "MRCommonUtility.h"
#import "NSData+CommonCrypto.h"

#define EncryptKey @"635ip|jpElkvqdii"
#define EncryptIV  @"635ip|jpElkvqdii"

@implementation MRCommonUtility
+ (NSString *)hexadecimalString:(NSData *)data
{
	const unsigned char *dataBuffer = (const unsigned char *)[data bytes];
	
	if (!dataBuffer)
	{
		return [NSString string];
	}
	
	NSUInteger          dataLength  = [data length];
	NSMutableString     *hexString  = [NSMutableString stringWithCapacity:(dataLength * 2)];
	
	for (int i = 0; i < dataLength; ++i)
	{
		[hexString appendFormat:@"%02x", (unsigned int)dataBuffer[i]];
	}
	
	return [NSString stringWithString:hexString];
}

+ (NSData *) dataFromHexString:(NSString *) hexstr
{
	NSMutableData *data = [[NSMutableData alloc] init];
	NSString *inputStr = [hexstr uppercaseString];
	
	NSString *hexChars = @"0123456789ABCDEF";
	
	Byte b1,b2;
	b1 = 255;
	for (int i=0; i<hexstr.length; i++) {
		NSString *subStr = [inputStr substringWithRange:NSMakeRange(i, 1)];
		NSRange loc = [hexChars rangeOfString:subStr];
		
		if (loc.location == NSNotFound) continue;
		
		if (255 == b1) {
			b1 = (Byte)loc.location;
		}else {
			b2 = (Byte)loc.location;
			
			//Appending the Byte to NSData
			Byte *bytes = malloc(sizeof(Byte) *1);
			bytes[0] = ((b1<<4) & 0xf0) | (b2 & 0x0f);
			[data appendBytes:bytes length:1];
			free(bytes);
			b1 = b2 = 255;
		}
	}
	
	return data;
}

+ (NSData *)getMRValue:(NSString *)key
{
	static char buffer[100] = {0};
	strcpy(buffer, key.UTF8String);
	size_t len = strlen(key.UTF8String);
	for (int i = 0; i < len; i++)
	{
		buffer[i] = (char)(((int)(buffer[i] - 32) ^ 5) + 32);
	}
	
	return [NSData dataWithBytes:buffer length:len];
}

#pragma mark - N300Encrypt
+ (NSString *)encryptString:(NSString *)str withKey:(NSString *)encryptKey
{
	//    if ([str length] == 0 || [encryptKey length] == 0) {
	//        return @"";
	//    }
	
	NSData *keyData = [self dataFromHexString:encryptKey];
	
	NSData *bodyData = [str dataUsingEncoding:NSUTF8StringEncoding];
	bodyData = [bodyData MRDataEncryptedUsingAlgorithm:kCCAlgorithmAES128 key:keyData initializationVector:[self getMRValue:EncryptIV] options:kCCOptionPKCS7Padding error:nil];
	
	NSString *ret = [self hexadecimalString:bodyData];
	return ret;
}


+ (NSString *)decryptString:(NSString *)str withKey:(NSString *)decryptKey
{
	if ([str length] == 0 || [decryptKey length] == 0) {
		return @"";
	}
	
	NSData *keyData = [self dataFromHexString:decryptKey];
	
	NSData *data = [self dataFromHexString:str];
	data = [data MRDecryptedDataUsingAlgorithm:kCCAlgorithmAES128 key:keyData initializationVector:[self getMRValue:EncryptIV] options:kCCOptionPKCS7Padding error:nil];
	NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	return ret;
}
@end
