//
//  NSString+Captcha.m
//  TLCaptcha
//
//  Created by Yuc on 2017/8/14.
//  Copyright © 2017年 TLCode. All rights reserved.
//

#import "NSString+Captcha.h"

@implementation NSString (Captcha)

+ (instancetype)randomCaptchaStringWithLength:(NSUInteger)length {
    int i = 0;
    char str[length];
    do {
        int path = arc4random_uniform(74) + 48;
        if ((47 < path && path < 58) ||
            (64 < path && path < 91) ||
            (96 < path && path < 123)) {
            str[i] = path;
            i++;
        }
    } while (i < length);
    NSString *retString = [NSString stringWithCString:str encoding:NSUTF8StringEncoding];
    
    return retString;
    
}

- (BOOL)isEqualToCaptcha:(NSString *)captcha {
    NSString *aString = [self lowercaseString];
    NSString *bString = [captcha lowercaseString];
    return [aString isEqualToString:bString];
}

@end
