//
//  ViewController.m
//  UIViewController
//
//  Created by 张博添 on 2021/6/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//当视图控制器第一次被加载显示视图时，调用此函数
//布局初始化视图来使用，初始化资源使用
- (void)viewDidLoad {
    
    //调用父亲类的加载
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 200);
    //将视图添加到当前控制视图上
    [self.view addSubview: view];
    
    view.backgroundColor = [UIColor orangeColor];
    self.view.backgroundColor = [UIColor blueColor];
    
}


@end
