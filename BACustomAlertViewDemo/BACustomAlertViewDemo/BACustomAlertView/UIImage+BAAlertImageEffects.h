//
//  UIImage+BAAlertImageEffects.h
//  BACustomAlertViewDemo
//
//  Created by zeroLu on 16/8/17.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BAAlertImageEffects)

- (UIImage*)BAAlert_ApplyLightEffect;

- (UIImage*)BAAlert_ApplyExtraLightEffect;

- (UIImage*)BAAlert_ApplyDarkEffect;

- (UIImage*)BAAlert_ApplyTintEffectWithColor:(UIColor*)tintColor;

- (UIImage*)BAAlert_ApplyBlurWithRadius:(CGFloat)blurRadius
                              tintColor:(UIColor*)tintColor
                  saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                              maskImage:(UIImage*)maskImage;


@end
