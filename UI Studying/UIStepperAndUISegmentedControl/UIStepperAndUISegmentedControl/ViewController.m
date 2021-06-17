//
//  ViewController.m
//  UIStepperAndUISegmentedControl
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize  stepper = _stepper;
@synthesize  segmentedControl = _segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建步进器对象
    _stepper = [[UIStepper alloc] init];
    
    //设置位置，宽高不能改变
    _stepper.frame = CGRectMake(100, 100, 80, 40);
    
    //设置步进器的最小值
    _stepper.minimumValue = 0;
    
    //设置步进器最大值
    _stepper.maximumValue = 100;
    
    //设置步进器当前值,默认为0
    _stepper.value = 10;
    
    //设置步进值，每次向前或向后的步伐值
    _stepper.stepValue = 1;
    
    //是否可以重复相应事件操作，即按住按钮是否持续执行，自动重复功能
    _stepper.autorepeat = YES;
    
    //是否将步进结果通过事件函数相应出来
    _stepper.continuous = YES;//是否在步进过程中响应
    
    //添加一个事件函数
    //1:函数实现体
    //2:函数体
    //3:事件值改变状态
    [_stepper addTarget:self action:@selector(stepChange) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview: _stepper];
    
    //创建分栏控件
    _segmentedControl = [[UISegmentedControl alloc] init];
    
    //设置控件位置，宽度可变，高度不可变
    _segmentedControl.frame = CGRectMake(10, 200, 300, 40) ;
    
    //添加一个按钮元素
    [_segmentedControl insertSegmentWithTitle:@"0元" atIndex:0 animated:NO];
    //P1:按钮选项位置
    //P2:按钮索引位置
    //P3:是否有插入的动画效果
    [_segmentedControl insertSegmentWithTitle:@"5元" atIndex:1 animated:NO];
    [_segmentedControl insertSegmentWithTitle:@"10元" atIndex:2 animated:NO];
    [_segmentedControl insertSegmentWithTitle:@"20元" atIndex:3 animated:NO];

    
    //当前默认按钮索引设置
    _segmentedControl.selectedSegmentIndex = 0;
    
    [_segmentedControl addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview: _segmentedControl];
    
    
    
    
    
}

-(void) segChange {
    NSLog(@"%ld", _segmentedControl.selectedSegmentIndex);
}



-(void) stepChange {
    NSLog(@"step press! value = %f", _stepper.value);
}



@end
