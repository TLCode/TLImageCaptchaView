//
//  TLImageCaptchaView.h
//  TLCaptcha
//
//  Created by Yuc on 2017/8/14.
//  Copyright © 2017年 TLCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Captcha.h"

@interface TLImageCaptchaView : UIView
/**
 随机生成的字符串
 */
@property (nonatomic, copy, readonly)               NSString    *captchaString;
/**
 字体是否倾斜 默认 fales
 */
@property (nonatomic, assign, getter=isItalic)      BOOL        italic;
/**
 字符串长度  默认为6
 */
@property (nonatomic, assign) uint                              captchaStringLenght;
/**
 刷新验证码
 */
- (void)reloadCaptcha;

@end
