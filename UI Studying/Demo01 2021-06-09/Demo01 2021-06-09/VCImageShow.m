//
//  VCImageShow.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/9.
//

#import "VCImageShow.h"

@interface VCImageShow ()

@end

@implementation VCImageShow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] init];
    float selfWidth = self.view.bounds.size.width;
    float selfHeight = selfWidth * 4 / 3;
    _imageView.frame =CGRectMake(0,
        ((self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height
         - self.tabBarController.tabBar.bounds.size.height) - selfHeight) / 2,
                                 selfWidth, selfHeight);
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Demo010%lu.jpg",_imageTag - 100]];
    
    
    [self.view addSubview: _imageView];
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
