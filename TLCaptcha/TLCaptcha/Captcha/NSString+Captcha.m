//
//  NSString+Captcha.m
//  TLCaptcha
//
//  Created by Yuc on 2017/8/14.
//  Copyright © 2017年 TLCode. All rights reserved.
//

#import "NSString+Captcha.h"

static NSString * const DVCaptchaComponentsString = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

@implementation NSString (Captcha)

+ (instancetype)randomCaptchaStringWithLength:(NSUInteger)length {
    NSMutableString *captcha = [NSMutableString stringWithCapacity:length];
    for (int i = 0; i < length; i++) {
        unichar str = [DVCaptchaComponentsString characterAtIndex:arc4random_uniform((uint32_t)DVCaptchaComponentsString.length)];
        [captcha appendFormat:@"%C", str];
    }
    return [captcha copy];
}

- (BOOL)isEqualToCaptcha:(NSString *)captcha {
    NSString *aString = [self lowercaseString];
    NSString *bString = [captcha lowercaseString];
    return [aString isEqualToString:bString];
}

@end
