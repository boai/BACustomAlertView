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

typedef void(^ButtonActionBlock)(NSInteger index);

@interface BACustomActionSheet : UIView 

/*!
 *  创建一个不带标题的ActionSheet
 *
 *  @param list              ActionSheet的各个选项
 *  @param clikckButtonIndex 按钮的点击事件
 */
+ (void)ba_showActionSheetWithList:(NSArray *)list
                 ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex;

/*!
 *  创建一个带标题的ActionSheet
 *
 *  @param list              ActionSheet的各个选项
 *  @param title             标题
 *  @param clikckButtonIndex 按钮的点击事件
 */
+ (void)ba_showActionSheetHaveTitleWithList:(NSArray *)list
                                      title:(NSString *)title
                          ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex;
@end
