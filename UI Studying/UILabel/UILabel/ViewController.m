//
//  ViewController.m
//  UILabel
//
//  Created by 张博添 on 2021/6/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建UI控件函数
-(void) creatUI {
    //定义并创建一个UILable
    //UILable是可以显示在屏幕上，并可以显示文字的一种UI视图
    UILabel* label = [[UILabel alloc] init];
    
    //显示文字的赋值，字符串对象
    label.text = @"Hello World! My name is Billy.";
    
    //设置lable的显示位置，前两个是坐标，后两个是矩形大小
    label.frame = CGRectMake(100, 100, 160, 120);
    
    //设置lable的背景颜色,clearColor为透明
    label.backgroundColor = [UIColor grayColor];
    
    //屏幕背景颜色
    //self.view.backgroundColor = [UIColor grayColor];
    
    //将lable显示到屏幕上
    [self.view addSubview: label];
    
    //设置label文字大小，使用系统默认字体，大小为24
    label.font = [UIFont systemFontOfSize: 24];
    
    //设置文字颜色
    label.textColor = [UIColor blueColor];
    
    //label高级属性
    //设定阴影的颜色
    label.shadowColor = [UIColor clearColor];
    //设置阴影的偏移位置
    label.shadowOffset = CGSizeMake(3, 3);
    
    //设置text文字对齐模式，默认为靠左对齐
    //label.textAlignment = NSTextAlignmentCenter;
    //label.textAlignment = NSTextAlignmentRight;
    label.textAlignment  = NSTextAlignmentLeft;
    
    //设置lable文字显示的行数，默认为1
    //其他大于0的行数，文字会尽量按照设定行数来显示
    //如果为0，iOS会对文字自动计算所需要的行数，按照需要来显示
    label.numberOfLines = 0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //调用创建UI函数
    [self creatUI];
}

@end
