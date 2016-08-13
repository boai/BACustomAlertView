# BACustomAlertView
一个完全实现自定义的alertView！

> ###目前为止，最为精简的alert封装，欢迎小伙伴儿们刷刷刷！


本alert特点：<br />
1、手势触摸隐藏<br />
2、可以自定义背景图片、按钮颜色<br />
3、可以添加文字和图片，且可以滑动查看<br />
4、完全兼容目前所有 iOS 系统版本

####注：目前此版本只支持竖屏适配，小伙伴儿记得哦！


### 代码示例：
```
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

```

### 图片示例：
![image](https://github.com/boai/BACustomAlertView/blob/master/image2.png)

![image](https://github.com/boai/BACustomAlertView/blob/master/image.png)
