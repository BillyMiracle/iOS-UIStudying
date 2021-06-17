//
//  ViewController.m
//  UIView02
//
//  Created by 张博添 on 2021/6/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建三个视图对象
    UIView* view01 = [[UIView alloc] init];
    view01.frame = CGRectMake(100, 100, 150, 150);
    view01.backgroundColor = [UIColor blueColor];
    
    UIView* view02 = [[UIView alloc] init];
    view02.frame = CGRectMake(125, 125, 150, 150);
    view02.backgroundColor = [UIColor orangeColor];
    
    UIView* view03 = [[UIView alloc] init];
    view03.frame = CGRectMake(150, 150, 150, 150);
    view03.backgroundColor = [UIColor greenColor];
    
    //将三个视图对象显示到屏幕上
    //并且添加到父亲视图上
    //哪一个视图被先添先添加到视图中，就先绘制哪一个视图
    //按添加顺序绘制
    [self.view addSubview: view01];
    [self.view addSubview: view02];
    [self.view addSubview: view03];
    
    //将某一个视图调整到最前面
    //参数：UIView对象，调整哪一个视图到最前方
    [self.view bringSubviewToFront:view01];
    
    //将某一个视图调整到最后方
    [self.view sendSubviewToBack: view03];
    
    //subViews：管理所有self.view的子视图的数组
    
    UIView* viewFront = self.view.subviews[2];
    
    UIView* viewBack = self.view.subviews[0];
    
    if (viewBack == view03) {
        NSLog(@"相等");
    }
    
    [view01 removeFromSuperview];
    
}


@end
