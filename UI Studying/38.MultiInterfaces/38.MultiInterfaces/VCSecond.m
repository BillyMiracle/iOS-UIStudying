//
//  VCSecond.m
//  38.MultiInterfaces
//
//  Created by 张博添 on 2021/6/9.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //改变颜色导航按钮
    UIBarButtonItem* btnChange = [[UIBarButtonItem alloc] initWithTitle:@"ChangeColor" style:UIBarButtonItemStyleDone target:self action:@selector(pressChange)];
    
    self.navigationItem.rightBarButtonItem = btnChange;
    
}
//点击按钮时，触发代理事件
-(void) pressChange {
    
    //代理对象调用事件函数
    [_delegate changeColer:[UIColor redColor]];
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
