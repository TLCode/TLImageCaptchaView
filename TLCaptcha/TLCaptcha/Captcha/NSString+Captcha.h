//
//  NSString+Captcha.h
//  TLCaptcha
//
//  Created by Yuc on 2017/8/14.
//  Copyright © 2017年 TLCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Captcha)

/**
 获取随机字符串
 
 @param length 指定字符串长度
 @return 随机字符串
 */
+ (instancetype)randomCaptchaStringWithLength:(NSUInteger)length;

/**
 判断结果是否与验证码一致
 
 @param captcha 验证码
 @return 是否正确
 */
- (BOOL)isEqualToCaptcha:(NSString *)captcha;

@end
