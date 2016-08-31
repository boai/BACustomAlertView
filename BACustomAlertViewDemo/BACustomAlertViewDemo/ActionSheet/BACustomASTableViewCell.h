//
//  BACustomASTableViewCell.h
//  BACustomAlertViewDemo
//
//  Created by zeroLu on 16/8/31.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *CustomCellIdentifier = @"BACustomASTableViewCell";

@interface BACustomASTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *customImageView;
@property (weak, nonatomic) IBOutlet UILabel *customTextLabel;
@end
