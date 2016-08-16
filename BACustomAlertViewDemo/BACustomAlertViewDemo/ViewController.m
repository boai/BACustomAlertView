
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客园  : http://www.cnblogs.com/boai/
 * 博客    : http://boai.github.io
 * 简书    : http://www.jianshu.com/users/95c9800fdf47/latest_articles
 * 简书专题 : http://www.jianshu.com/collection/072d578bf782
 
 *********************************************************************************
 
 */

#import "ViewController.h"
#import "BACustomAlertView.h"
#import "ViewController2.h"

static NSString * const titleMsg1 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。";
static NSString * const titleMsg2 = @"对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";

@interface ViewController ()
@property (weak, nonatomic  ) IBOutlet UITableView  *tableView;

@property (nonatomic, strong) BACustomAlertView     *alertView1;
@property (nonatomic, strong) BACustomAlertView     *alertView2;
@property (nonatomic, strong) BACustomAlertView     *alertView3;
@property (nonatomic, strong) BACustomAlertView     *alertView4;
@property (nonatomic, strong) BACustomAlertView     *alertView5;

@property (nonatomic,strong ) UIButton              *chooseBtn;
@property (nonatomic,strong ) UILabel               *titleLabel;

@property (strong, nonatomic) NSArray               *dataArray;

@end

@implementation ViewController

- (NSArray *)dataArray
{
    if ( !_dataArray )
    {
        _dataArray = [NSArray arrayWithObjects:@[@"1、类似系统alert【加边缘手势消失】",
                                                 @"2、自定义按钮颜色",
                                                 @"3、自定义背景图片",
                                                 @"4、内置图片和文字，可滑动查看",
                                                 @"5、完全自定义alert"],
                                               @[@"BACustomAlertView特点：\n1、手势触摸隐藏\n2、可以自定义背景图片、按钮颜色\n3、可以添加文字和图片，且可以滑动查看！\n4、横竖屏适配完美\n5、理论完全兼容现有所有 iOS 系统版本"
                        ], nil];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"博爱的BACustomAlertView";
}

#pragma mark - UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ( !cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.numberOfLines = 0;
        
        cell.accessoryType = 0 == indexPath.section?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
        cell.selectionStyle = 0 == indexPath.section?UITableViewCellSelectionStyleDefault:UITableViewCellSelectionStyleNone;
    }
    NSArray *tempArray = self.dataArray[indexPath.section];
    cell.textLabel.text = tempArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( 0 == indexPath.section )
    {
        [self showAlertAction:indexPath.row + 1];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击事件
- (void)showAlertAction:(NSInteger)index
{
    switch (index) {
        case 1:
            [self performSelector:@selector(alert1)];
            break;
        case 2:
            [self performSelector:@selector(alert2)];
            break;
        case 3:
            [self performSelector:@selector(alert3)];
            break;
        case 4:
            [self performSelector:@selector(alert4)];
            break;
        case 5:
            [self performSelector:@selector(alert5)];
            break;
            
        default:
            break;
    }
}

- (void)alert1
{
//    /*! 1、类似系统alert【加边缘手势消失】 */
//    _alertView1 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
//
//                                                    image:nil
//                                             buttonTitles:@[@"取消", @"确定"]];
//    _alertView1.bgColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
//    /*! 是否开启边缘触摸隐藏 alert */
//    _alertView1.isTouchEdgeHide = YES;
//    /*! 显示alert */
//    [_alertView1 ba_showAlertView];
//    
    BAWeak;
//    _alertView1.buttonActionBlock = ^(NSInteger index){
//        if (index == 0)
//        {
//            NSLog(@"点击了取消按钮！");
//            /*! 隐藏alert */
////            [weakSelf.alertView1 ba_dismissAlertView];
//        }
//        else if (index == 1)
//        {
//            NSLog(@"点击了确定按钮！");
//            ViewController2 *vc2 = [ViewController2 new];
//            vc2.title = @"alert1";
//            [weakSelf.navigationController pushViewController:vc2 animated:YES];
//            /*! 隐藏alert */
////            [weakSelf.alertView1 ba_dismissAlertView];
//        }
//    };

    /*! 第一种封装使用示例 */
    [BACustomAlertView ba_showAlertWithTitle:@"博爱温馨提示："
                                     message:titleMsg1
                                       image:nil
                                buttonTitles:@[@"取消",@"确定"]
                               configuration:^(BACustomAlertView *temp) {
        temp.bgColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
        temp.isTouchEdgeHide = YES;
    }
                                 actionClick:^(NSInteger index) {
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
//            [weakSelf.alertView1 ba_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert1";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
//            [weakSelf.alertView1 ba_dismissAlertView];
        }
    }];
}

- (void)alert2
{
    /*! 2、自定义按钮颜色 */
    _alertView2                  = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                  message:titleMsg2
                                                    image:nil
                                             buttonTitles:@[@"取消", @"确定"]];
    /*! 自定义按钮文字颜色 */
    _alertView2.buttonTitleColor = [UIColor orangeColor];
    _alertView2.bgColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:0.3];

    /*! 显示alert */
    [_alertView2 ba_showAlertView];
    BAWeak;
    _alertView2.buttonActionBlock = ^(NSInteger index){
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
//            [weakSelf.alertView2 ba_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert2";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
//            [weakSelf.alertView2 ba_dismissAlertView];
        }
    };
}

- (void)alert3
{
    /*! 3、自定义背景图片 */
    _alertView3                  = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                  message:titleMsg1
                                                    image:nil
                                             buttonTitles:@[@"取消", @"确定"]];
    /*! 自定义按钮文字颜色 */
    _alertView3.buttonTitleColor = [UIColor orangeColor];
    /*! 自定义alert的背景图片 */
    _alertView3.bgImageName      = @"背景.jpg";
    /*! 显示alert */
    [_alertView3 ba_showAlertView];
    BAWeak;
    _alertView3.buttonActionBlock = ^(NSInteger index){
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
//            [weakSelf.alertView3 ba_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert3";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
//            [weakSelf.alertView3 ba_dismissAlertView];
        }
    };
}

- (void)alert4
{
    /*! 4、内置图片和文字，可滑动查看 */
    _alertView4                  = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                  message:titleMsg1
                                                    image:[UIImage imageNamed:@"美女.jpg"]
                                             buttonTitles:@[@"取消", @"确定"]];
    /*! 自定义按钮文字颜色 */
    _alertView4.buttonTitleColor = [UIColor orangeColor];
    /*! 自定义alert的背景图片 */
    _alertView4.bgImageName      = @"背景.jpg";
    /*! 是否显示动画效果 */
    _alertView4.isShowAnimate    = YES;
    /*! 显示alert */
    [_alertView4 ba_showAlertView];
    BAWeak;
    _alertView4.buttonActionBlock = ^(NSInteger index){
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
//            [weakSelf.alertView4 ba_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert4";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
//            [weakSelf.alertView4 ba_dismissAlertView];
        }
    };
}

- (void)alert5
{
    /*! 5、完全自定义alert */
    UIView *view1                = [UIView new];
    view1.frame                  = CGRectMake(30, 100, SCREENWIDTH - 60, 200);
    view1.backgroundColor        = [UIColor yellowColor];
    view1.layer.masksToBounds    = YES;
    view1.layer.cornerRadius     = 10.0f;
    //    view1.clipsToBounds    = YES;
    
    _titleLabel                  = [UILabel new];
    _titleLabel.frame            = CGRectMake(0, 0, view1.frame.size.width, 40);
    _titleLabel.text             = @"测试title";
    _titleLabel.textAlignment    = NSTextAlignmentCenter;
    _titleLabel.font             = [UIFont systemFontOfSize:18];
    _titleLabel.backgroundColor  = [UIColor greenColor];
    [view1 addSubview:_titleLabel];
    _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _chooseBtn                   = [[UIButton alloc]initWithFrame:CGRectMake(0, view1.frame.size.height - 40, view1.frame.size.width, 40)];
    //        _chooseBtn         = [UIButton buttonWithType:UIButtonTypeCustom];
    [_chooseBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_chooseBtn setBackgroundColor:[UIColor redColor]];
    [_chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_chooseBtn addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:_chooseBtn];
    _chooseBtn.autoresizingMask  = UIViewAutoresizingFlexibleWidth;
    
    _alertView5                  = [[BACustomAlertView alloc] initWithCustomView:view1];
    [_alertView5 ba_showAlertView];
}

- (void)cancleButtonAction:(UIButton *)sender
{
    NSLog(@"点击了取消按钮！");
    /*! 隐藏alert */
    [_alertView5 ba_dismissAlertView];
}

@end
