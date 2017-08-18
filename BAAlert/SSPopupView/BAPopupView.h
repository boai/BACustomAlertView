//
//  BAPopupView.h
//
//  Created by 石少庸 on 2015/3/10.
//  Copyright © 2015年 SpringSeason. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - enum

// SSPopupShowType: 弹出动画
typedef NS_ENUM(NSInteger, SSPopupShowType) {
    SSPopupShowTypeNone = 0,//无动画效果
    SSPopupShowTypeFadeIn,//淡出
    SSPopupShowTypeGrowIn,//由小变大
    SSPopupShowTypeShrinkIn,//由小变大回弹
    SSPopupShowTypeSlideInFromTop,//由顶部掉下
    SSPopupShowTypeSlideInFromBottom,//从底部弹出
    SSPopupShowTypeSlideInFromLeft,//从屏幕左边弹出
    SSPopupShowTypeSlideInFromRight,//从屏幕右边弹出
    SSPopupShowTypeBounceIn,//从底部弹出
    SSPopupShowTypeBounceInFromTop,//从底部弹出
    SSPopupShowTypeBounceInFromBottom,//从底部弹出
    SSPopupShowTypeBounceInFromLeft,//从底部弹出
    SSPopupShowTypeBounceInFromRight,//从底部弹出
};

// SSPopupDismissType: 消失动画
typedef NS_ENUM(NSInteger, SSPopupDismissType) {
    SSPopupDismissTypeNone = 0,
    SSPopupDismissTypeFadeOut,
    SSPopupDismissTypeGrowOut,
    SSPopupDismissTypeShrinkOut,
    SSPopupDismissTypeSlideOutToTop,
    SSPopupDismissTypeSlideOutToBottom,
    SSPopupDismissTypeSlideOutToLeft,
    SSPopupDismissTypeSlideOutToRight,
    SSPopupDismissTypeBounceOut,
    SSPopupDismissTypeBounceOutToTop,
    SSPopupDismissTypeBounceOutToBottom,
    SSPopupDismissTypeBounceOutToLeft,
    SSPopupDismissTypeBounceOutToRight,
};

// SSPopupHorizontalLayout: 横向布局位置
typedef NS_ENUM(NSInteger, SSPopupHorizontalLayout) {
    SSPopupHorizontalLayoutCustom = 0,
    SSPopupHorizontalLayoutLeft,
    SSPopupHorizontalLayoutLeftOfCenter,
    SSPopupHorizontalLayoutCenter,
    SSPopupHorizontalLayoutRightOfCenter,
    SSPopupHorizontalLayoutRight,
};

// SSPopupVerticalLayout: 纵向布局位置
typedef NS_ENUM(NSInteger, SSPopupVerticalLayout) {
    SSPopupVerticalLayoutCustom = 0,
    SSPopupVerticalLayoutTop,
    SSPopupVerticalLayoutAboveCenter,
    SSPopupVerticalLayoutCenter,
    SSPopupVerticalLayoutBelowCenter,
    SSPopupVerticalLayoutBottom,
};



// SSPopupMaskType: 交互方式
typedef NS_ENUM(NSInteger, SSPopupMaskType) {
    SSPopupMaskTypeNone = 0, // 背景可交互
    SSPopupMaskTypeClear, // 不可交互
    SSPopupMaskTypeDimmed, // 不可交互
};

// SSPopupLayout: 布局，跟CGSize类似
struct SSPopupLayout {
    SSPopupHorizontalLayout horizontal;
    SSPopupVerticalLayout vertical;
};
typedef struct SSPopupLayout SSPopupLayout;

// 布局方法
extern SSPopupLayout SSPopupLayoutMake(SSPopupHorizontalLayout horizontal, SSPopupVerticalLayout vertical);

// 快捷居中
extern const SSPopupLayout SSPopupLayoutCenter;

@interface BAPopupView : UIView

#pragma mark - property

// 你想要显示的view
// 在弹出之前一定要先添加了
// 至少要提供size，位置可以使用上面👆的SSPopupLayout来指定.
// 如不提供SSPopupLayout，默认是居中的
@property (nonatomic, strong) UIView *contentView;

// 显示动画，默认是shrink in
@property (nonatomic, assign) SSPopupShowType showType;

// 消失动画，默认是shrink out
@property (nonatomic, assign) SSPopupDismissType dismissType;

// 蒙版，默认是dimmed
@property (nonatomic, assign) SSPopupMaskType maskType;

// 蒙版透明度，默认是0.5
@property (nonatomic, assign) CGFloat dimmedMaskAlpha;

// 点击蒙版可消失，默认YES
@property (nonatomic, assign) BOOL shouldDismissOnBackgroundTouch;

// 点击contenview消失，默认NO
@property (nonatomic, assign) BOOL shouldDismissOnContentTouch;

// 显示后回调
@property (nonatomic, copy) void (^didFinishShowingCompletion)();

// 将要消失回调
@property (nonatomic, copy) void (^willStartDismissingCompletion)();

// 消失后回调
@property (nonatomic, copy) void (^didFinishDismissingCompletion)();

#pragma mark - method

/**
 显示，类方法

 @param contentView 内容视图
 @return instencetype
 */
+ (BAPopupView *)popupWithContentView:(UIView*)contentView;

/**
 显示，类方法

 @param contentView 内容视图
 @param showType 显示
 @param dismissType 消失
 @param maskType 蒙版
 @param shouldDismissOnBackgroundTouch 蒙版可交互
 @param shouldDismissOnContentTouch 内容可交互
 @return intancetype
 */
+ (BAPopupView *)popupWithContentView:(UIView *)contentView
                         showType:(SSPopupShowType)showType
                      dismissType:(SSPopupDismissType)dismissType
                         maskType:(SSPopupMaskType)maskType
         dismissOnBackgroundTouch:(BOOL)shouldDismissOnBackgroundTouch
            dismissOnContentTouch:(BOOL)shouldDismissOnContentTouch;

// 让窗体全部消失，相当于一个清理的方法
+ (void)dismissAllPopups;

// 不需要制定显示的位置
// 默认显示在中心
- (void)show;
// 指定位置显示
- (void)showWithLayout:(SSPopupLayout)layout;
// 指定显示时间
- (void)showWithDuration:(NSTimeInterval)duration;
// 时间和位置同时指定
- (void)showWithLayout:(SSPopupLayout)layout duration:(NSTimeInterval)duration;
// 下面👇的俩方法都是可以指定中心点来显示
- (void)showAtCenter:(CGPoint)center inView:(UIView*)view;
- (void)showAtCenter:(CGPoint)center inView:(UIView *)view withDuration:(NSTimeInterval)duration;

// 消失，默认animated = YES
- (void)dismiss:(BOOL)animated;

#pragma mark  - 子类实现

@property (nonatomic, strong, readonly) UIView *backgroundView;
@property (nonatomic, strong, readonly) UIView *containerView;
@property (nonatomic, assign, readonly) BOOL isBeingShown;
@property (nonatomic, assign, readonly) BOOL isShowing;
@property (nonatomic, assign, readonly) BOOL isBeingDismissed;

- (void)willStartShowing;
- (void)didFinishShowing;
- (void)willStartDismissing;
- (void)didFinishDismissing;

@end

#pragma mark - UIView Category

@interface UIView(KLCPopup)
- (void)forEachPopupDoBlock:(void (^)(BAPopupView *popup))block;
- (void)dismissPresentingPopup;
@end
