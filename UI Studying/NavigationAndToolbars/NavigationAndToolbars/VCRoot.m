//
//  VCRoot.m
//  NavigationAndToolbars
//
//  Created by 张博添 on 2021/6/7.
//

#import "VCRoot.h"
#import "VCSecond.h"
@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    //设置导航栏风格颜色
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //将风格设置为不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置导航栏颜色
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    //设置导航元素项目按钮的风格颜色
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    //隐藏导航栏
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBarHidden = NO;
    self.title = @"根视图";
    
    UIBarButtonItem* button = [[UIBarButtonItem alloc] initWithTitle:@"右侧按钮" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = button;
    
    //显示工具栏对象
    //默认为YES
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.toolbar.translucent = NO;
    
    //创建3个工具栏按钮
    UIBarButtonItem* button01 = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    
    UIBarButtonItem* button02 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
        target:nil action:nil];
    
    UIButton* buttonNew = [UIButton buttonWithType: UIButtonTypeCustom];
    [buttonNew setImage: [UIImage imageNamed:@"btn01.png"] forState: UIControlStateNormal];
    buttonNew.frame = CGRectMake(0, 0, 60, 60);
    UIBarButtonItem* button03 = [[UIBarButtonItem alloc] initWithCustomView: buttonNew];
    
    //固定宽度占位按钮
    UIBarButtonItem* buttonFixed01 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    buttonFixed01.width = 100;
    
    //创建自动计算宽度按钮
    UIBarButtonItem* buttonFlexible02 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //按钮数组的创建
    NSArray* arrayButtons = [NSArray arrayWithObjects:button01, buttonFlexible02, button02, buttonFlexible02, button03, nil];
    
    self.toolbarItems = arrayButtons;
}

-(void) pressNext {
    VCSecond* vc = [[VCSecond alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
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
