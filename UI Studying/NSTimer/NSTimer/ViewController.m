//
//  ViewController.m
//  NSTimer
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//属性和成员变量同步
@synthesize  timerView = _timerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //启动定时器按钮
    UIButton* touchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    touchButton.frame = CGRectMake(100, 100, 80, 40);
    [touchButton setTitle:@"启动定时器" forState:UIControlStateNormal];
    [touchButton addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: touchButton];
    
    //停止定时器按钮
    UIButton* buttonStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStop.frame = CGRectMake(100, 200, 80, 40);
    [buttonStop setTitle:@"停止定时器" forState:UIControlStateNormal];
    [buttonStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: buttonStop];
    
    UIView* view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview: view];
    
    //设置view标签值
    //通过父亲视图对象以及view的标签值可以获得相应的视图对象
    view.tag = 101;
    
}
//按下开始按钮函数
-(void) pressStart {
    //NSTimer类方法创建定时器并启动定时器
    //P1：每隔多长时间调用定时器参数，以秒为单位
    //P2：表示实现定时器函数的对象
    //P3：定时器函数对象
    //P4：定时器函数中的一个参数，参数无可以传nil
    //P5：定时器是否重复操作，YES为重复，NO只完成一次函数调用
    //返回值为一个新建好的定时器对象
    _timerView = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer:)
        userInfo:@"Billy" repeats:YES];
}

//定时器函数
//可以将定时器本身作为参数传入
-(void) updateTimer: (NSTimer*) timer {
    NSLog(@"test!!! Name = %@", timer.userInfo);
    
    //最好tag从100开始
    UIView* view = [self.view viewWithTag:101];
    
    view.frame = CGRectMake(view.frame.origin.x + 0.5,
                            view.frame.origin.y + 0.5,
        view.frame.size.width, view.frame.size.height);
}


//按下停止按钮函数
-(void) pressStop {
    if(_timerView != nil) {
        NSLog(@"停止计时器");
        [_timerView invalidate];
    }
}

@end
