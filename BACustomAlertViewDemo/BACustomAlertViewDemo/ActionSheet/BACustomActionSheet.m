//
//  BACustomActionSheet.m
//  BACustomAlertViewDemo
//
//  Created by zeroLu on 16/8/30.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "BACustomActionSheet.h"
#import "BACustomASTableViewCell.h"

@interface BACustomActionSheet ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (strong, nonatomic) UITableView  *tableView;

@property (strong, nonatomic) UIControl    *overlayView;

@property (strong, nonatomic) NSArray      *dataArray;

@property (strong, nonatomic) NSArray      *imageArray;

@property (assign, nonatomic) NSInteger    specialIndex;

@property (copy, nonatomic  ) NSString     *title;

@property (copy, nonatomic) void(^callback)(NSInteger index);

@property (assign, nonatomic) BACustomActionSheetViewStyle viewStyle;

@end

@implementation BACustomActionSheet

+ (instancetype)shareActionSheet
{
    BACustomActionSheet *actionSheet = [[self alloc] init];
    actionSheet.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    return actionSheet;
}

+ (void)ba_showActionSheetHaveTitleWithViewStyle:(BACustomActionSheetViewStyle)style List:(NSArray<NSString *> *)list ImageList:(NSArray<UIImage *> *)imagelist Special:(NSInteger)specialIndex title:(NSString *)title ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex {
    BACustomActionSheet *actionSheet = [self shareActionSheet];
    actionSheet.dataArray            = list;
    actionSheet.callback             = clikckButtonIndex;
    actionSheet.viewStyle            = style;
    actionSheet.imageArray           = imagelist;
    actionSheet.specialIndex         = specialIndex;
    actionSheet.title                = title;
    [actionSheet.tableView reloadData];
    [actionSheet show];
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( 0 == section ) {
        if ( self.viewStyle == BACustomActionSheetNormal || self.viewStyle == BACustomActionSheetImage )
        {
            return self.dataArray.count;
        }else
        {
            return self.dataArray.count + 1;
        }
    }else {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return (section == 0)?8.f:0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BACustomASTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = (self.title)?UITableViewCellSelectionStyleNone:UITableViewCellSelectionStyleDefault;
    if ( 0 == indexPath.section )
    {
        if ( self.viewStyle == BACustomActionSheetNormal )
        {
            cell.customTextLabel.text = self.dataArray[indexPath.row];
            
        }else if ( self.viewStyle == BACustomActionSheetTitle )
        {
            
            cell.customTextLabel.text = (indexPath.row ==0)?self.title:self.dataArray[indexPath.row-1];
        }else {
            if ( indexPath.row == self.specialIndex ) {
                cell.customTextLabel.textColor = [UIColor redColor];
            }
            NSInteger index = (self.title)?indexPath.row - 1:indexPath.row;
            if ( index >= 0 ) {
                cell.customImageView.image = self.imageArray[index];
            }
            
            cell.customTextLabel.text = (indexPath.row ==0)?self.title:self.dataArray[indexPath.row-1];
        }
    }else
    {
        cell.customTextLabel.text = @"取消";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( 0 == indexPath.section )
    {
        NSInteger index = 0;
        if ( self.viewStyle == BACustomActionSheetNormal || self.viewStyle == BACustomActionSheetImage )
        {
            index = indexPath.row;
            
        }else {
            index = indexPath.row - 1;
        }
        self.callback(index);
    }
    else
    {
        [self dismiss];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UpdateFrame
- (void)fadeIn
{
    CGFloat tableViewHeight = MIN(SCREENHEIGHT - 64.f, self.tableView.contentSize.height);
    self.tableView.frame = CGRectMake(0.f, 0.f, SCREENWIDTH, tableViewHeight);
    
    self.frame = CGRectMake(0.f, SCREENHEIGHT, SCREENWIDTH, tableViewHeight);
    BAWeak;
    [UIView animateWithDuration:.25f animations:^{
        weakSelf.frame = CGRectMake(0.f, SCREENHEIGHT - tableViewHeight, SCREENWIDTH, tableViewHeight);
    }];
}

- (void)fadeOut
{
    BAWeak;
    [UIView animateWithDuration:.25f animations:^{
        weakSelf.frame = CGRectMake(0.f, SCREENHEIGHT, SCREENWIDTH, CGRectGetHeight(weakSelf.frame));
    } completion:^(BOOL finished) {
        if (finished) {
            [weakSelf.overlayView removeFromSuperview];
            weakSelf.overlayView = nil;
            [weakSelf removeFromSuperview];
        }
    }];
}

- (void)layoutSubviews {
    CGFloat tableViewHeight = MIN(SCREENHEIGHT - 64.f, self.tableView.contentSize.height);
    
    self.tableView.frame = CGRectMake(0.f, 0.f, SCREENWIDTH, tableViewHeight);
    
    self.frame = CGRectMake(0.f, SCREENHEIGHT - tableViewHeight, SCREENWIDTH, tableViewHeight);
}

- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:self.overlayView];
    [keywindow addSubview:self];
    [self fadeIn];
}

- (void)dismiss
{
    [self fadeOut];
}

#pragma mark - lazy
- (UITableView *)tableView {
    if ( !_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.f];
        [self addSubview:_tableView];
        [_tableView registerNib:[UINib nibWithNibName:CustomCellIdentifier bundle:nil] forCellReuseIdentifier:CustomCellIdentifier];
    }
    return _tableView;
}

- (UIControl *)overlayView {
    if ( !_overlayView ) {
        _overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
        [_overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _overlayView;
}

@end
