//
//  ViewController.m
//  BACustomAlertViewDemo
//
//  Created by boai on 16/8/13.
//  Copyright © 2016年 博爱. All rights reserved.
//

#import "ViewController.h"
#import "BACustomAlertView.h"


static NSString * const titleMsg1 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。";
static NSString * const titleMsg2 = @"对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";

@interface ViewController ()

@property (nonatomic, strong) BACustomAlertView  *alertView1;
@property (nonatomic, strong) BACustomAlertView  *alertView2;
@property (nonatomic, strong) BACustomAlertView  *alertView3;
@property (nonatomic, strong) BACustomAlertView  *alertView4;
@property (nonatomic, strong) BACustomAlertView  *alertView5;

@property (nonatomic,strong ) UIButton           *chooseBtn;
@property (nonatomic,strong ) UILabel            *titleLabel;


- (IBAction)buttonAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        _alertView1 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg1
                                                        image:nil
                                                 buttonTitles:@[@"取消", @"确定"]];
        [_alertView1 ba_showAlertView];
        
        BAWeak;
        _alertView1.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                [weakSelf.alertView1 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                [weakSelf.alertView1 ba_dismissAlertView];
            }
        };
    }
    else if (sender.tag == 2)
    {
        _alertView2 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg2
                                                        image:nil
                                                 buttonTitles:@[@"取消", @"确定"]];
        _alertView2.buttonTitleColor = [UIColor orangeColor];
        [_alertView2 ba_showAlertView];
        BAWeak;
        _alertView2.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                [weakSelf.alertView2 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                [weakSelf.alertView2 ba_dismissAlertView];
            }
        };
    }
    else if (sender.tag == 3)
    {
        _alertView3 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg1
                                                        image:nil
                                                 buttonTitles:@[@"取消", @"确定"]];
        _alertView3.buttonTitleColor = [UIColor orangeColor];
        _alertView3.bgImageName = @"背景.jpg";
        [_alertView3 ba_showAlertView];
        BAWeak;
        _alertView3.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                [weakSelf.alertView3 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                [weakSelf.alertView3 ba_dismissAlertView];
            }
        };
    }
    else if (sender.tag == 4)
    {
        _alertView4 = [[BACustomAlertView alloc] ba_showTitle:@"博爱温馨提示："
                                                      message:titleMsg1
                                                        image:[UIImage imageNamed:@"美女.jpg"]
                                                 buttonTitles:@[@"取消", @"确定"]];
        _alertView4.buttonTitleColor = [UIColor orangeColor];
        _alertView4.bgImageName = @"背景.jpg";
        [_alertView4 ba_showAlertView];
        BAWeak;
        _alertView4.buttonActionBlock = ^(NSInteger index){
            if (index == 0)
            {
                NSLog(@"点击了取消按钮！");
                [weakSelf.alertView4 ba_dismissAlertView];
            }
            else if (index == 1)
            {
                NSLog(@"点击了确定按钮！");
                [weakSelf.alertView4 ba_dismissAlertView];
            }
        };
    }
    else if (sender.tag == 5)
    {
        UIView *view1 = [UIView new];
        view1.frame = CGRectMake(30, 100, SCREENWIDTH - 60, 200);
        view1.backgroundColor = [UIColor yellowColor];
        view1.layer.masksToBounds = YES;
        view1.layer.cornerRadius = 10.0f;
        //    view1.clipsToBounds = YES;
        
        _titleLabel = [UILabel new];
        _titleLabel.frame = CGRectMake(0, 0, view1.frame.size.width, 40);
        _titleLabel.text = @"测试title";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.backgroundColor = [UIColor greenColor];
        [view1 addSubview:_titleLabel];
        
        _chooseBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, view1.frame.size.height - 40, view1.frame.size.width, 40)];
        [_chooseBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_chooseBtn setBackgroundColor:[UIColor redColor]];
        [_chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_chooseBtn addTarget:self action:@selector(chooseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view1 addSubview:_chooseBtn];

        _alertView5 = [[BACustomAlertView alloc] initWithCustomViewiew:view1];
        [_alertView5 ba_showAlertView];
    }
}

- (void)chooseBtnClick:(UIButton *)sender
{
    NSLog(@"点击了取消按钮！");
    [_alertView5 ba_dismissAlertView];
}


@end
