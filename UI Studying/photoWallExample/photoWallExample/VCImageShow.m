//
//  VCImageShow.m
//  photoWallExample
//
//  Created by 张博添 on 2021/6/8.
//

#import "VCImageShow.h"

@interface VCImageShow ()

@end

@implementation VCImageShow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Photo";
    
    //新建的_imageView
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(0, 0,
            self.view.bounds.size.width,
            self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height
                                  - self.navigationController.toolbar.bounds.size.height);
    //方法二：
    _imageView.image = _image;
    //方法一：
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"17_%lu.jpg",_imageTag - 100]];
    
    //一个视图对象只能有一个根视图
    //当我们把视图添加到新的父视图上面去时
    //从原来父视图中删除
    //所以不能直接传imageView
    [self.view addSubview:_imageView];
    
    
    
    
    
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
