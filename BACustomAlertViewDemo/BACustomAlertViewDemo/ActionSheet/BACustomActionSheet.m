//
//  BACustomActionSheet.m
//  BACustomAlertViewDemo
//
//  Created by zeroLu on 16/8/30.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "BACustomActionSheet.h"


@interface BACustomActionSheet ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (strong, nonatomic) UITableView  *tableView;

@property (strong, nonatomic) UIControl    *overlayView;

@property (strong, nonatomic) NSArray      *dataArray;

@property (copy, nonatomic  ) NSString     *title;

@property (copy, nonatomic) void(^callback)(NSInteger index);

@end

@implementation BACustomActionSheet

+ (instancetype)shareActionSheet
{
    static BACustomActionSheet *actionSheet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        actionSheet = [[self alloc] init];
        actionSheet.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin;
    });
    return actionSheet;
}

/*!
 *  创建一个带标题的ActionSheet
 *
 *  @param list              ActionSheet的各个选项
 *  @param title             标题
 *  @param clikckButtonIndex 按钮的点击事件
 */
+ (void)ba_showActionSheetHaveTitleWithList:(NSArray *)list
                                      title:(NSString *)title
                          ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex
{
    BACustomActionSheet *actionSheet = [self shareActionSheet];
    actionSheet.dataArray            = list;
    actionSheet.title                = title;
    actionSheet.callback             = clikckButtonIndex;
    [actionSheet.tableView reloadData];
    [actionSheet show];
}

/*!
 *  创建一个不带标题的ActionSheet
 *
 *  @param list              ActionSheet的各个选项
 *  @param clikckButtonIndex 按钮的点击事件
 */
+ (void)ba_showActionSheetWithList:(NSArray *)list
                 ClikckButtonIndex:(ButtonActionBlock)clikckButtonIndex
{
    BACustomActionSheet *actionSheet = [self shareActionSheet];
    actionSheet.dataArray            = list;
    actionSheet.callback             = clikckButtonIndex;
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
        return self.title?self.dataArray.count+1:self.dataArray.count;
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
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ( !cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if ( 0 == indexPath.section )
    {
        if ( self.title )
        {
            cell.textLabel.text = (indexPath.row ==0)?self.title:self.dataArray[indexPath.row-1];
        }else
        {
            cell.textLabel.text = self.dataArray[indexPath.row];
        }
    }else
    {
        cell.textLabel.text = @"取消";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( 0 == indexPath.section )
    {
        self.callback(indexPath.row);
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
    CGFloat tableViewHeight = self.tableView.contentSize.height;
    self.tableView.frame = CGRectMake(0.f, 0.f, SCREENWIDTH, tableViewHeight);
    
    self.frame = CGRectMake(0.f, SCREENHEIGHT, SCREENWIDTH, tableViewHeight);
    BAWeak;
    [UIView animateWithDuration:.25f animations:^{
        weakSelf.frame = CGRectMake(0.f, SCREENHEIGHT - CGRectGetHeight(weakSelf.frame), SCREENWIDTH, CGRectGetHeight(weakSelf.frame));
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
        _tableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.f];
        [self addSubview:_tableView];
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
