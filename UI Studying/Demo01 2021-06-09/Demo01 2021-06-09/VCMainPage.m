//
//  VCMainPage.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/10.
//

#import "VCMainPage.h"
#import "VCFirst.h"
#import "VCSecond.h"
#import "VCThird.h"

@interface VCMainPage ()

@end

@implementation VCMainPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self dismissViewControllerAnimated:NO completion:nil];
    
    VCFirst* vcFirst = [[VCFirst alloc] init];
    VCSecond* vcSecond = [[VCSecond alloc] init];
    VCThird* vcThird = [[VCThird alloc] init];
    vcFirst.title = @"首页";
    vcSecond.title = @"购买";
    vcThird.title = @"个人中心";
    //创建三个导航控制器
    UINavigationController* nav01 = [[UINavigationController alloc] initWithRootViewController: vcFirst];
    UINavigationController* nav02 = [[UINavigationController alloc] initWithRootViewController: vcSecond];
    UINavigationController* nav03 = [[UINavigationController alloc] initWithRootViewController: vcThird];
    //创建分栏控制器对象
    UITabBarController* tbController = [[UITabBarController alloc] init];
    //tbController = [[UITabBarController alloc] init];
    NSArray* arrayVC = [NSArray arrayWithObjects: nav01, nav02, nav03, nil];
    tbController.viewControllers = arrayVC;
    tbController.tabBar.translucent = NO;
    
    [self addChildViewController: nav01];
    [self addChildViewController: nav02];
    [self addChildViewController: nav03];
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
