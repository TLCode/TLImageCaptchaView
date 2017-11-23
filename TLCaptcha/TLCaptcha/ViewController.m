//
//  ViewController.m
//  TLCaptcha
//
//  Created by Yuc on 2017/8/14.
//  Copyright © 2017年 TLCode. All rights reserved.
//

#import "ViewController.h"
#import "TLImageCaptchaView.h"

#define SCREEN_WIDTH CGRectGetWidth([[UIScreen mainScreen] bounds])

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, strong)   TLImageCaptchaView  *captchaView;
@property (nonatomic, strong)   UITextField         *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpConfig];
}

- (void)setUpConfig {
    [self.view addSubview:({
        _captchaView = [[TLImageCaptchaView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 120) / 2, 200, 120, 40)];
        _captchaView.captchaStringLenght = 4;
        _captchaView.italic = YES;
        _captchaView;
    })];
    
    [self.view addSubview:({
        _textField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 120) / 2, 300, 120, 40)];
        _textField.delegate = self;
        _textField.keyboardType = UIKeyboardTypeAlphabet;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField;
    })];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    BOOL equal = [textField.text isEqualToCaptcha:_captchaView.captchaString];
    if (equal) {
        [textField resignFirstResponder];
    }
    return equal;
}
@end
