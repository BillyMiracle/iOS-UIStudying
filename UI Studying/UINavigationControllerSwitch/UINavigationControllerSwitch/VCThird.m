//
//  VCThird.m
//  UINavigationControllerSwitch
//
//  Created by 张博添 on 2021/6/7.
//

#import "VCThird.h"

@interface VCThird ()

@end

@implementation VCThird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"第三级";
    
    UIBarButtonItem* buttonLeft = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    
    //自己设定左侧按钮时
    //返回按钮会被替换
    self.navigationItem.leftBarButtonItem = buttonLeft;
    
    UIBarButtonItem* buttonRight = [[UIBarButtonItem alloc] initWithTitle:@"返回根视图" style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    
    self.navigationItem.rightBarButtonItem = buttonRight;
    
}

-(void) pressRight {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) pressBack {
    //将当前的视图控制器弹出，返回到上一级界面
    [self.navigationController popViewControllerAnimated: YES];
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
