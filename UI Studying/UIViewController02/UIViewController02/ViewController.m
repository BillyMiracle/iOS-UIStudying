//
//  ViewController.m
//  UIViewController02
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"
#import "ViewController02.h"

@interface ViewController ()

@end

@implementation ViewController

//当屏幕被点击时，调用此函数
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //创建视图控制器02
    ViewController02* view02 = [[ViewController02 alloc] init];
    
    //显示一个新的视图控制器到屏幕上
    //P1:新的视图控制器对象
    //P2:是否使用动画切换效果
    //P3:切换结束后功能调用，不需要直接传nil值即可
    [self presentViewController:view02 animated:YES completion:nil];
    
}



//第一次程序加载视图时调用
//只加载一次
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    NSLog(@"viewDidload! 第一次加载视图！");
}
//当视图控制器的视图即将显示时，调用此函数
//视图分为：1显示前（不显示），2正在处于显示状态，3已经被隐藏
//参数表示是否用动画切换后显示

-(void) viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
    
}
//视图即将消失时调用
//参数：表示是否用动画切换后消失
//当前的状态视图还是显示在屏幕上的
-(void) viewWillDisappear:(BOOL)animated {
    NSLog(@"视图即将消失");
}

//当视图已经显示到屏幕后的瞬间调用此函数
//参数：表示是否用动画切换显示
//当前状态已经显示到屏幕上了
-(void) viewDidAppear:(BOOL)animated {
    NSLog(@"视图已经显示");
}

//当前视图已经从屏幕上消失
//参数：表示是否用动画切换显示
//当前视图控制器已经从屏幕上消失
-(void) viewDidDisappear:(BOOL)animated {
    NSLog(@"视图已经消失");
}


@end
