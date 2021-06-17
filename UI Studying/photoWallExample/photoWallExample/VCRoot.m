//
//  VCRoot.m
//  photoWallExample
//
//  Created by 张博添 on 2021/6/8.
//

#import "VCRoot.h"
#import "VCImageShow.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Photo Wall";
    
    //使导航栏不透明
    self.navigationController.navigationBar.translucent = NO;
    
    //显示工具栏对象
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.translucent = NO;
    
    UIScrollView* scrollView01 = [[UIScrollView alloc] init];
    
    //设置位置、大小
    scrollView01.frame = CGRectMake(0, 0, self.view.bounds.size.width,
            self.view.bounds.size.height
                                    - self.navigationController.navigationBar.bounds.size.height
                                    - self.navigationController.toolbar.bounds.size.height);
    
    //设置画布大小
    scrollView01.contentSize = CGSizeMake(self.view.bounds.size.width,
            (self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height
             - self.navigationController.toolbar.bounds.size.height) * 3);
    
    //是否按页滚动
    //scrollView01.pagingEnabled = YES;
    
    //打开交互事件
    scrollView01.userInteractionEnabled = YES;
    scrollView01.backgroundColor = [UIColor grayColor];
    
    for (int i = 0; i < 12; ++i) {
        
        NSString* imageName = [NSString stringWithFormat:@"17_%d.jpg", i + 1];
        
        UIImage* image = [UIImage imageNamed: imageName];
        
        UIImageView* iView = [[UIImageView alloc] initWithImage: image];
        
        double imageWidth = (self.view.bounds.size.width - 40)/3;
        double imageHeight = imageWidth ;
        
        iView.frame = CGRectMake(10 * (i % 3 + 1) + imageWidth * (i % 3),
                                 10 * (i / 3 + 1) + imageHeight * (i / 3),
                                 imageWidth,
                                 imageHeight);
        
        scrollView01.showsVerticalScrollIndicator = NO;
        
        [scrollView01 addSubview:iView];
        //开启交互模式
        iView.userInteractionEnabled = YES;
        //创建点击手势
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        //单次点击
        tap.numberOfTapsRequired = 1;
        //单个手指
        tap.numberOfTouchesRequired = 1;
        
        [iView addGestureRecognizer: tap];
        
        //图像对象的tag值
        iView.tag = 101 + i;
    }
    
    [self.view addSubview:scrollView01];
    
}
//方法1:
-(void) pressTap: (UITapGestureRecognizer*) tap {
    UIImageView* imageView = (UIImageView*) tap.view;
    
    //创建视图显示控制器
    VCImageShow* imageShow = [[VCImageShow alloc] init];
    
    imageShow.imageTag = imageView.tag;
    
    [self.navigationController pushViewController:imageShow animated:YES];
    
    
    
    
}

/*
 //方法2:
-(void) pressTap: (UITapGestureRecognizer*) tap {
    //NSLog(@"点击事件触发");
    UIImageView* imageView = (UIImageView*) tap.view;
    
    //创建视图显示控制器
    //VCImageShow* imageShow = [[VCImageShow alloc] init];
    //点击的图像视图赋值
    //imageShow.imageView = imageView;
    //将控制器推出
    //[self.navigationController pushViewController:imageShow animated:YES];
    
    //上面的代码会导致弹出的图片在返回后消失
    //创建视图显示控制器
    VCImageShow* imageShow = [[VCImageShow alloc] init];
    //点击的图像通过图片的指针进行赋值
    imageShow.image = imageView.image;
    //将控制器推出
    [self.navigationController pushViewController:imageShow animated:YES];
    
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
