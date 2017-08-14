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

@property (nonatomic, copy, readonly)               NSString    *captchaString;
@property (nonatomic, assign, getter=isItalic)      BOOL        italic; //倾斜

/**
 刷新验证码
 */
- (void)reloadCaptcha;

@end
