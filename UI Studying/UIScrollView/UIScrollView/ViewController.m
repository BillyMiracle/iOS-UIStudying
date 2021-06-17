//
//  ViewController.m
//  UIScrollView
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //定义并创建一个滚动视图
    //可以对视图内容滚屏查看功能
    UIScrollView* scrollView = [[UIScrollView alloc] init];
    
    int currentHeight = self.view.bounds.size.height;
    int currentWidth = self.view.bounds.size.width;
    //设置滚动视图的位置，使用矩形来定位视图
    scrollView.frame = CGRectMake(0,
            50,
            currentWidth,
            currentHeight - 100);
    
    //是否按照整页来滚动视图
    scrollView.pagingEnabled = YES;
    //是否可以开启滚动效果
    scrollView.scrollEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大于Frame大小
    scrollView.contentSize = CGSizeMake(currentWidth * 5,
                currentHeight - 100);
    //是否可以有边缘弹动效果
    scrollView.bounces = YES;
    //开启横向弹动效果
    scrollView.alwaysBounceHorizontal = YES;
    //开启纵向弹动效果
    scrollView.alwaysBounceVertical = NO;
    //是否显示横向滚动条
    scrollView.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条
    scrollView.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    scrollView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview: scrollView];
    
    for(int i = 0; i < 2; i++) {
        NSString* strName = [NSString stringWithFormat:@"EXAMPLE%d.jpg", i + 1];
        
        UIImage* image = [UIImage imageNamed: strName];
        
        UIImageView* imageView = [[UIImageView alloc] initWithImage: image];
        
        imageView.frame = CGRectMake(currentWidth * i,
                0,
                currentWidth,
                currentHeight - 100);
        
        [scrollView addSubview: imageView];
        
    }
    
    
}


@end
