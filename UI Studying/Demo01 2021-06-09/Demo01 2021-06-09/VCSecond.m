//
//  VCSecond.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/14.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"Purchase.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor lightGrayColor];
    scrollView01 = [[UIScrollView alloc] init];
    scrollView01.frame = CGRectMake(0, 0, self.view.bounds.size.width,
                                    self.view.bounds.size.height
                                    - self.navigationController.navigationBar.bounds.size.height
                                    - self.tabBarController.tabBar.bounds.size.height);
    scrollView01.contentSize = CGSizeMake(self.view.bounds.size.width,
                                          (self.view.bounds.size.height
                                            - self.navigationController.navigationBar.bounds.size.height
                                            - self.tabBarController.tabBar.bounds.size.height) * 3);
    
    scrollView01.backgroundColor = [UIColor lightGrayColor];
    
    UIView* backView01 = [[UIView alloc] init];
    backView01.frame = CGRectMake(0, -30, self.view.bounds.size.width, 90);
    backView01.backgroundColor = [UIColor colorWithWhite:1 alpha:0.9];
    
    UITextField* searchTextField = [[UITextField alloc] init];
    searchTextField.frame = CGRectMake(20, 40,
            self.view.bounds.size.width - 100, 40);
    searchTextField.placeholder = @"搜索";
    searchTextField.borderStyle = UITextBorderStyleBezel;
    searchTextField.backgroundColor = [UIColor whiteColor];
    
    UIButton* searchButton = [UIButton buttonWithType: UIButtonTypeCustom];
    searchButton.frame = CGRectMake(self.view.bounds.size.width - 70, 40, 50, 40);
    searchButton.backgroundColor = [UIColor orangeColor];
    [searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    
    [backView01 addSubview: searchButton];
    [backView01 addSubview: searchTextField];
    [scrollView01 addSubview: backView01];
    [self.view addSubview: scrollView01];
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
