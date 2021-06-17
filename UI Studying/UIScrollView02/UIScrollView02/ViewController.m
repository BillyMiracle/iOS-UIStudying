//
//  ViewController.m
//  UIScrollView02
//
//  Created by 张博添 on 2021/6/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    int currentHeight = self.view.bounds.size.height;
    int currentWidth = self.view.bounds.size.width;
    
    //创建滚动视图
    _scrollView = [[UIScrollView alloc] init];
    //位置
    _scrollView.frame = CGRectMake(0,
        50,
        currentWidth,
        currentHeight - 100);
    //弹动效果
    _scrollView.bounces = NO;
    //是否允许通过点击屏幕让滚动视图响应事件
    //YES：滚动视图可以接受触碰事件
    //NO：不接受触屏事件
    //_scrollView.userInteractionEnabled = NO;
    //画布大小，纵向效果
    _scrollView.contentSize = CGSizeMake(currentWidth, (currentHeight - 100) * 9);
    
    for(int i = 0; i < 9; i++) {
        //生成图片名称
        NSString* strName = [NSString stringWithFormat:@"17_%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed: strName];
        
        UIImageView* iView = [[UIImageView alloc] init];
        iView.image = image;
        iView.frame = CGRectMake(0, (currentHeight - 100) * i, currentWidth, currentHeight - 100);
        
        [_scrollView addSubview: iView];
    }
    
    
    
    [self.view addSubview: _scrollView];
    
    //取消按页滚动效果
    _scrollView.pagingEnabled = NO;
    
    //滚动视图画布的移动位置，偏移位置
    //功能：决定画布显示的最终图像结果
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    //将当前视图控制器作为代理对象
    _scrollView.delegate = self;

}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //_scrollView.contentOffset = CGPointMake(0, 0);
    int currentHeight = self.view.bounds.size.height;
    int currentWidth = self.view.bounds.size.width;
    //让滚动视图移动到指定位置，动画移动
    [_scrollView scrollRectToVisible:CGRectMake(0, 0, currentWidth, currentHeight - 100) animated:YES];
}

//当滚动视图移动时，只要offset坐标发生变化，都会调用此函数
//参数：调用此协议的滚动视图对象
//可以使用此函数来监控滚动视图的位置
-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"y = %f", scrollView.contentOffset.y);
}

//当滚动视图结束拖动时调用此函数
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"Did End Dragging");
}

//滚动视图即将开始被拖动时
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Will Begin Dragging");
}

//视图即将结束拖动时调用
-(void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"Will End Dragging");
}

//即将减速
-(void) scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Will Begin Decelerating");
}

//视图已经结束减速时，停止瞬间
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Did Begin Decelerating, Stop Moving");
}

@end
