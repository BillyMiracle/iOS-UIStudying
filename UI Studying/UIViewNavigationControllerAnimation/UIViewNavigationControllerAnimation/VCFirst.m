//
//  VCFirst.m
//  UIViewNavigationControllerAnimation
//
//  Created by 张博添 on 2021/6/14.
//

#import "VCFirst.h"
#import "VCSecond.h"
@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(40, 40, 260, 380);
    _imageView.image = [UIImage imageNamed:@"Demo0101.jpg"];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview: _imageView];
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //定义一个动画变换对象，层动画对象
    //类方法获取动画对象
    CATransition* amin = [CATransition animation];
    //时间长度
    amin.duration = 1;
    //动画类型，决定效果形式
    //amin.type = @"cube";
    amin.type = @"pageUnCurl";
    
    //子类型，例如动画的方向
    amin.subtype = kCATransitionFromRight;
    //设置动画轨迹模式
    amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //将动画设置对象添加到动画上
    [self.navigationController.view.layer addAnimation:amin forKey:nil];
    
    
    VCSecond* vcSecond = [[VCSecond alloc] init];
    
    [self.navigationController pushViewController:vcSecond animated:YES];
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
