//
//  ViewController.m
//  UIButtonEventProcessing
//
//  Created by 张博添 on 2021/6/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建按钮函数
-(void) creatBtn {
    //创建圆角按钮
    UIButton* btn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 40);
    
    //btn.backgroundColor = [UIColor grayColor];
    
    [btn setTitle:@"按钮1" forState: UIControlStateNormal];
    //向按钮添加事件参数
    //P1:谁来实现事件函数，实现者对象就是“谁”
    //P2:@selector(pressBtn)：函数对象，当按钮满足P3事件类型时，调用函数
    //P3:UIControlEvent：事件处理函数类型
    //UIControlEventTouchUpInside：当手指离开屏幕时并且离开瞬间位置在按钮范围内，触发事件函数
    //UIControlEventTouchUpOutside
    //UIControlEventTouchDown: 手指触碰到按钮就触发
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    //范围有些大，是因为模拟器的范围与真机不同
    
    //触碰时调用事件函数,一个按钮可以添加多个事件
    [btn addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview: btn];
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(100, 200, 80, 40);
    [btn2 setTitle:@"按钮2" forState:UIControlStateNormal];
    
    //是可以多个按钮使用同一个事件函数来处理不同事件
    [btn2 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview: btn2];
    
    //设置按钮的标记值
    btn.tag = 101;
    btn2.tag = 102;
}
/*
-(void) pressBtn2 {
    NSLog(@"按钮2被触发");
}*/
//
-(void) touchDown {
    NSLog(@"按钮1被触碰");
}


//参数为调用次函数按钮对象本身
-(void) pressBtn: (UIButton*) btn {
    if(btn.tag == 101) {
        NSLog(@"btn1 pressed");
    } else if(btn.tag == 102) {
        NSLog(@"btn2 pressed");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatBtn];
}

@end
