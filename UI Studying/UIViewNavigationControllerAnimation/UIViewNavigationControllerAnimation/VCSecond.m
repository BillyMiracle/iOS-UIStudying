//
//  VCSecond.m
//  UIViewNavigationControllerAnimation
//
//  Created by 张博添 on 2021/6/14.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"控制器2";
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(40, 40, 260, 380);
    _imageView.image = [UIImage imageNamed:@"Demo0102.jpg"];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview: _imageView];
    
    
}
//返回控制器1
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CATransition* amin = [CATransition animation];
    
    amin.duration = 1;
    
    amin.type = @"pageCurl";
    
    amin.subtype = kCATransitionFromRight;
    
    [self.navigationController.view.layer addAnimation:amin forKey: nil];
    
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
