//
//  TLImageCaptchaView.m
//  TLCaptcha
//
//  Created by Yuc on 2017/8/14.
//  Copyright © 2017年 TLCode. All rights reserved.
//

#import "TLImageCaptchaView.h"

@interface TLImageCaptchaView ()

@property (nonatomic, copy, readwrite)   NSString    *captchaString;

@end

@implementation TLImageCaptchaView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpConfig];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpConfig];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpConfig];
    }
    return self;
}

- (void)setUpConfig {
    self.backgroundColor = randomColor();
    self.captchaString = [NSString randomCaptchaStringWithLength:6];
    UITapGestureRecognizer *tagGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reloadCaptcha)];
    [self addGestureRecognizer:tagGesture];
    self.userInteractionEnabled = YES;
}

- (void)reloadCaptcha {
    self.captchaString = [NSString randomCaptchaStringWithLength:6];
    self.backgroundColor = randomColor();
    [self setNeedsDisplay];
}

- (void)setItalic:(BOOL)italic {
    _italic = italic;
    [self setNeedsDisplay];
}

/**
 绘制图片验证码
 
 1.随机背景色
 2.for 循环 字符串 随机取(x, y)坐标 插入字符 并设置fontSize （可选：倾斜度）
 3.随机画几条干扰线
 
 */
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGFloat itemWidth = CGRectGetWidth(rect) / self.captchaString.length;
    CGFloat itemHeight = CGRectGetHeight(rect);
    for (int i = 0; i < self.captchaString.length; i++) {
        unichar character = [self.captchaString characterAtIndex:i];
        NSString *characterString = [NSString stringWithFormat:@"%C", character];
        
        //字号
        CGFloat fontSize = arc4random_uniform(itemHeight * .3f) + itemHeight * .4f;
        
        //字符属性
        NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName];
        
        if (self.isItalic) {
            //字体倾斜
            int direction = arc4random_uniform(2);
            CGFloat obliqueness = arc4random_uniform(5) / 10.f;
            [attributes setObject:@(obliqueness * (direction ? 1 : -1)) forKey:NSObliquenessAttributeName];
        }
        
        //字符宽度
        CGRect characterRect = [characterString boundingRectWithSize:CGSizeMake(itemWidth, itemHeight)
                                                             options:NSStringDrawingUsesLineFragmentOrigin
                                                          attributes:attributes
                                                             context:nil];
        CGFloat characterWidth = CGRectGetWidth(characterRect);
        
        //x轴居中，y轴随机
        CGFloat x = (itemWidth - characterWidth) / 2.f + itemWidth * i;
        CGFloat y = arc4random_uniform(itemHeight - fontSize);
        
        [characterString drawAtPoint:CGPointMake(x, y) withAttributes:attributes];
    }
    //画干扰线
    for (int i = 0; i < self.captchaString.length; i++) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGFloat x = arc4random_uniform(CGRectGetMidX(rect));
        CGFloat y = arc4random_uniform(CGRectGetHeight(rect));
        CGFloat destX = arc4random_uniform(CGRectGetMidX(rect)) + CGRectGetMidX(rect);
        CGFloat destY = arc4random_uniform(CGRectGetHeight(rect));
        CGContextMoveToPoint(ctx, x, y);
        CGContextSetLineWidth(ctx, .5f);
        CGContextSetRGBStrokeColor(ctx,
                                   arc4random_uniform(256) / 255.f,
                                   arc4random_uniform(256) / 255.f,
                                   arc4random_uniform(256) / 255.f,
                                   1.f);
        CGContextAddLineToPoint(ctx, destX, destY);
        CGContextStrokePath(ctx);
    }
}

UIColor *randomColor() {
    return [UIColor colorWithRed:arc4random_uniform(256) / 255.f
                           green:arc4random_uniform(256) / 255.f
                            blue:arc4random_uniform(256) / 255.f
                           alpha:1];
}

@end
