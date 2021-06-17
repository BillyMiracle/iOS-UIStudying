//
//  ViewController02.m
//  UIViewController02
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController02.h"

@interface ViewController02 ()

@end

@implementation ViewController02

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //第二个视图控制器为橘色
    self.view.backgroundColor = [UIColor orangeColor];
}

//点击当前控制器2界面屏幕时
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使当前的人控制器消失掉
    //P1: 是否动画效果
    //P2：结束后是否调用功能block块操作，不需要就nil
    [self dismissViewControllerAnimated:YES completion:nil];
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
