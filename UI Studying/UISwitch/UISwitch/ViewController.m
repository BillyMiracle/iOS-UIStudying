//
//  ViewController.m
//  UISwitch
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  mySwitch = _mySwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建一个开关对象
    //继承于UIView的
    _mySwitch = [[UISwitch alloc] init];
    
    //苹果官方控件的位置
    //位置XY值可以改变
    //宽度和高度值无法改变（无效）
    _mySwitch.frame = CGRectMake(100, 200, 80, 40);
    //_mySwitch.backgroundColor = [UIColor orangeColor];
    
    //开关状态设置属性
    //YES：开启状态
    //NO：关闭状态
    _mySwitch.on = YES;
    //也可以使用set函数
    [_mySwitch setOn: YES];
    
    //设置开关状态
    //P1：状态设置
    //P2：是否开启动画
    [_mySwitch setOn:YES animated:YES];
    
    [self.view addSubview: _mySwitch];
    
    //设置开启状态的风格颜色
    [_mySwitch setOnTintColor:[UIColor redColor]];
    
    //设置按钮风格颜色
    [_mySwitch setThumbTintColor:[UIColor grayColor]];
    
    //设置整体风格颜色
    [_mySwitch setTintColor:[UIColor purpleColor]];
    
    //向开关控件添加事件函数
    //P1:函数实现对象
    //P2：函数对象
    //P3:事件响应时的事件类型UIControlEventValueChanged：状态发生变化时触发函数
    [_mySwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
}

-(void) switchChange: (UISwitch*) mySwitch{
    if (mySwitch.on == YES) {
        NSLog(@"开关被打开");
    } else {
        NSLog(@"开关被关闭");
    }
    NSLog(@"开关状态发生变化！");
}


@end
