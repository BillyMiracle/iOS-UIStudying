//
//  VCSecond.m
//  UINavigationControllerSwitch
//
//  Created by 张博添 on 2021/6/7.
//

#import "VCSecond.h"
#import "VCThird.h"
@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.title = @"视图二";
    
    UIBarButtonItem* buttonNext = [[UIBarButtonItem alloc] initWithTitle:@"第三级" style:UIBarButtonItemStylePlain target:self action:@selector(pressNext)];
    
    self.navigationItem.rightBarButtonItem = buttonNext;
    
}
//
-(void) pressNext {
    VCThird* vc = [[VCThird alloc] init];
    //推入第三个视图控制器
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
