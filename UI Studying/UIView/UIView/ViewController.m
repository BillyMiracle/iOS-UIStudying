//
//  ViewController.m
//  UIView
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
    
    //创建一个UIView对象
    //UIView是iOS中的视图对象
    //显示在屏幕上的所有的对象的基础类
    //所有显示在屏幕上的对象一定都继承于UIView
    //屏幕上能看到的对象都是UIView的子类
    //UIView是一个矩形对象，有背景颜色，可以显示，有层级关系
    UIView* view = [[UIView alloc] init];
    
    //设置UIView位置
    //x向右，y向下
    view.frame = CGRectMake(100, 100, 100, 200);
    
    view.backgroundColor = [UIColor blueColor];
    
    //将新建的视图添加到父亲视图上
    //1.将新建视图显示到屏幕上
    //2.将视图作为父亲视图的子视图管理起来
    [self.view addSubview: view];
    
    //是否隐藏视图对象
    //YES:不显示
    //NO:显示，默认为NO
    view.hidden = NO;
    
    //设置透明度
    //aplha等于1，不透明，等于0，透明，0.5，半透明
    //view.alpha = 0.5;
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //设置是否显示不透明
    //YES：不透明，NO：透明
    //默认为YES
    //它决定不了当前UIView是否透明
    //作用是：给绘图系统提供一个性能优化开关
    //如果该值为YES，那么绘图在绘制该视图时把整个视图当作不透明对待
    view.opaque = NO;
    
    //将自己从父亲视图删除掉
    //1:从父亲视图的管理中删除
    //2:不会显示在屏幕上
    //[view removeFromSuperview];
}


@end
