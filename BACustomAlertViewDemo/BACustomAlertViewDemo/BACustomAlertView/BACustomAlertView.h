
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


#import <UIKit/UIKit.h>

#define SCREENWIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT   [UIScreen mainScreen].bounds.size.height

#define BAWeak         __weak __typeof(self) weakSelf = self


/*! 背景高斯模糊枚举 默认：1 */
typedef NS_ENUM(NSInteger, BACustomAlertViewBlurEffectStyle) {
    /*! 较亮的白色模糊 */
    BACustomAlertViewBlurEffectStyleExtraLight = 1,
    /*! 一般亮的白色模糊 */
    BACustomAlertViewBlurEffectStyleLight,
    /*! 深色背景模糊 */
    BACustomAlertViewBlurEffectStyleDark
} NS_ENUM_AVAILABLE_IOS(8_0);

/*! 进出场动画枚举 默认：1 */
typedef NS_ENUM(NSUInteger, BACustomAlertViewAnimatingStyle) {
    /*! 缩放显示动画 */
    BACustomAlertViewAnimatingStyleScale = 1,
    /*! 晃动动画 */
    BACustomAlertViewAnimatingStyleShake,
    /*! 天上掉下动画 / 上升动画 */
    BACustomAlertViewAnimatingStyleFall,
};

@interface BACustomAlertView : UIView

/*! 背景颜色 默认：白色*/
@property (nonatomic, strong) UIColor   *bgColor;

/*! 按钮字体颜色 默认：白色*/
@property (nonatomic, strong) UIColor   *buttonTitleColor;

/*! 是否有晃动动画 默认：关闭*/
@property (nonatomic, assign) BOOL       isShowAnimate;

/*! 是否开启边缘触摸隐藏 alert 默认：关闭*/
@property (nonatomic, assign) BOOL       isTouchEdgeHide;

/*! 背景图片名字 默认：没有图片*/
@property (nonatomic, strong) NSString  *bgImageName;

/*! 背景高斯模糊枚举 默认：1 */
@property (nonatomic, assign) BACustomAlertViewBlurEffectStyle blurEffectStyle;

/*! 进出场动画枚举 默认：1 */
@property (nonatomic, assign) BACustomAlertViewAnimatingStyle animatingStyle;

/*!
 * 按钮点击事件回调
 */
@property (strong, nonatomic) void (^buttonActionBlock)(NSInteger index);


#pragma mark - 1、高度封装一行即可完全配置alert，如不习惯，可使用第二种常用方法
/*!
 *  创建一个完全自定义的 alertView
 *
 *  @param customView    自定义 View
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 */
+ (void)ba_showCustomView:(UIView *)customView
            configuration:(void (^)(BACustomAlertView *tempView)) configuration;

/*!
 *  创建一个类似于系统的alert
 *
 *  @param title         标题：可空
 *  @param message       消息内容：可空
 *  @param image         图片：可空
 *  @param buttonTitles  按钮标题：不可空
 *  @param configuration 属性配置：如 bgColor、buttonTitleColor、isTouchEdgeHide...
 *  @param action        按钮的点击事件处理
 */
+ (void)ba_showAlertWithTitle:(NSString *)title
                      message:(NSString *)message
                        image:(UIImage *)image
                 buttonTitles:(NSArray *)buttonTitles
                configuration:(void (^)(BACustomAlertView *tempView)) configuration
                  actionClick:(void (^)(NSInteger index)) action;

#pragma mark - 2、常用方法
/*!
 *  初始化自定义动画视图
 *  @return instancetype
 */
- (instancetype)initWithCustomView:(UIView *)customView;

/*!
 *  创建一个类似系统的警告框
 *
 *  @param title        title
 *  @param message      message
 *  @param image        image
 *  @param buttonTitles 按钮的标题
 *
 *  @return 创建一个类似系统的警告框
 */
- (instancetype)ba_showTitle:(NSString *)title
                     message:(NSString *)message
                       image:(UIImage *)image
                buttonTitles:(NSArray *)buttonTitles;

/*!
 *  视图显示
 */
- (void)ba_showAlertView;

/*!
 *  视图消失
 */
- (void)ba_dismissAlertView;


@end
