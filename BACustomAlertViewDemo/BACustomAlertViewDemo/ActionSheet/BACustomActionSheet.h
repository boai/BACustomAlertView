//
//  BACustomActionSheet.h
//  BACustomAlertViewDemo
//
//  Created by zeroLu on 16/8/30.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREENWIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT   [UIScreen mainScreen].bounds.size.height

#define BAWeak         __weak __typeof(self) weakSelf = self

typedef NS_ENUM(NSInteger, BACustomActionSheetViewStyle) {
    /**
     *  普通样式
     */
    BACustomActionSheetNormal = 1,
    /**
     *  带标题样式
     */
    BACustomActionSheetTitle,
    /**
     *  带图片和标题样式
     */
    BACustomActionSheetImageAndTitle,
    /**
     *  带图片样式
     */
    BACustomActionSheetImage,
};

typedef void(^ButtonActionBlock)(NSInteger index);

@interface BACustomActionSheet : UIView
/**
 *
 *
 *  @param style             样式
 *  @param list              选项数组(NSString数组)
 *  @param sepcialIndex      特别颜色的下标数组(NSNumber数组)
 *  @param title             标题内容(可空)
 *  @param clikckButtonIndex block回调点击的选项
 */
+ (void)ba_showActionSheetHaveTitleWithViewStyle:(BACustomActionSheetViewStyle)style
                                            List:(NSArray<NSString *> *)list
                                            ImageList:(NSArray<UIImage *> *)imagelist
                                         Special:(NSInteger)specialIndex
                                           title:(NSString *)title
                               ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex;
@end
