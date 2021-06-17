//
//  ViewController.m
//  UISliderAndUIProgressView
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize slider = _slider;
@synthesize progressView = _progressView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //进度条的创建
    _progressView = [[UIProgressView alloc] init];
    
    //进度条大小位置设置
    //进度条的高度不可以变化
    _progressView.frame = CGRectMake(50, 100, 300, 40);
    
    //设置进度条风格颜色
    _progressView.progressTintColor = [UIColor redColor];
    //设置背景的风格颜色
    _progressView.trackTintColor = [UIColor blackColor];
    
    //设置进度条的进度值
    //范围0～1
    //最小值0，最大值1
    //进度值的百分比
    _progressView.progress = 0.3;
    
    //设置进度条的风格特征
    _progressView.progressViewStyle = UIProgressViewStyleDefault;
    
    [self.view addSubview:_progressView];
    
    //创建滑动条对象
    _slider = [[UISlider alloc] init];
    
    //位置设置，高度不可变更
    _slider.frame = CGRectMake(10, 200, 300, 40);
    
    //设置滑动条最大值
    _slider.maximumValue = 100;
    
    //设置滑动条最小值，可以为负
    _slider.minimumValue = 0;
    
    //设置滑动条的滑块位置
    _slider.value = 30;
    
    //左侧滑条背景颜色
    _slider.minimumTrackTintColor = [UIColor blueColor];
    //右侧滑条背景颜色
    _slider.maximumTrackTintColor = [UIColor greenColor];
    //设置滑块的颜色
    _slider.thumbTintColor = [UIColor orangeColor];
    
    //对滑动条添加事件函数
    [_slider addTarget:self action:@selector(pressSlider) forControlEvents:UIControlEventValueChanged];
    
    //重写进度值的百分比
    _progressView.progress = (_slider.value - _slider.minimumValue) / (_slider.maximumValue - _slider.minimumValue);
    
    
    [self.view addSubview: _slider];
}

-(void) pressSlider {
    
    
    _progressView.progress = (_slider.value - _slider.minimumValue) / (_slider.maximumValue - _slider.minimumValue);
    NSLog(@"value = %f", _slider.value);
}





@end
