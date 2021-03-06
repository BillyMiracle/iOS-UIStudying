//
//  VCRoot.m
//  UINavigationControllerSwitch
//
//  Created by 张博添 on 2021/6/7.
//

#import "VCRoot.h"
#import "VCSecond.h"
#import "VCThird.h"


@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏透明度
    //默认为YES：可透明
    //NO：使导航栏不透明
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    self.title = @"根视图";
    
    UIBarButtonItem* next = [[UIBarButtonItem alloc] initWithTitle:@"下一级" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    
    self.navigationItem.rightBarButtonItem = next;
    
    
}

-(void) pressNext {
    //创建新的视图控制器
    VCSecond* vcSecond = [[VCSecond alloc] init];
    
    //使用当前视图控制器的导航控制器指针对象
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
