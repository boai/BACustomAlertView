//
//  BACustomActionSheet.h
//  BACustomAlertViewDemo
//
//  Created by zeroLu on 16/8/30.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonActionBlock)(NSInteger index);

@interface BACustomActionSheet : UIView 

+ (void)ba_showActionSheetWithList:(NSArray *)list
                 ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex;

+ (void)ba_showActionSheetHaveTitleWithList:(NSArray *)list
                                      title:(NSString *)title
                 ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex;
@end
