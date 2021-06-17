//
//  VCFirst.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/9.
//

#import "VCFirst.h"
#import "VCFirstNew.h"
#import "VCImageShow.h"
@interface VCFirst ()
<UIScrollViewDelegate>

@property (strong, nonatomic) UIPageControl* pageControl;
@property (strong, nonatomic) NSTimer* timer;

@end

@implementation VCFirst
- (instancetype)init {
  if (self = [super init]) {
    self.tabBarItem.image = [UIImage imageNamed:@"MainPage.png"];
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.translucent = NO;
    //self.title = @"首页";
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
    
    scrollView02 = [[UIScrollView alloc] init];
    scrollView02.frame = CGRectMake(0, 80, self.view.bounds.size.width,
                                    self.view.bounds.size.width * 4/3);
    scrollView02.contentSize = CGSizeMake(self.view.bounds.size.width * 5,
                                          self.view.bounds.size.width * 4/3);

    
    
    UIButton* titleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    titleButton.frame = CGRectMake(0, 0, self.view.bounds.size.width, 80);
    titleButton.titleLabel.font = [UIFont italicSystemFontOfSize:30];
    [titleButton setBackgroundImage:[UIImage imageNamed: @"DemoTitleBackground.jpg"] forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [titleButton setTitle:@"新品上市" forState:UIControlStateNormal];
    [titleButton setTag: 101];
    [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [titleButton addTarget: self action: @selector(pressTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    for(int i = 0; i < 5; i++) {
        //生成图片名称
        NSString* strName = [NSString stringWithFormat:@"Demo010%d.jpg", i + 1];
        UIImage* image = [UIImage imageNamed: strName];
        
        UIImageView* iView = [[UIImageView alloc] init];
        iView.image = image;
        iView.frame = CGRectMake((self.view.bounds.size.width) * i, 0, self.view.bounds.size.width, self.view.bounds.size.width * 4/3);
        iView.tag = i + 101;
        
        iView.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressImage:)];
        tap.numberOfTapsRequired = 1;
        tap.numberOfTouchesRequired = 1;
        [iView addGestureRecognizer: tap];
        
        [scrollView02 addSubview: iView];
    }
    
    scrollView02.backgroundColor = [UIColor whiteColor];
    scrollView02.pagingEnabled = YES;
    scrollView02.userInteractionEnabled = YES;
    scrollView02.contentOffset = CGPointMake(0, 0);
    
    //图片轮播
    scrollView02.showsVerticalScrollIndicator = NO;
    scrollView02.showsHorizontalScrollIndicator = NO;
    scrollView02.delegate = self;
    pageControl01 = [[UIPageControl alloc] init];
    pageControl01.frame = CGRectMake((scrollView02.frame.size.width - 200) / 2, scrollView02.frame.size.height + 40, 200, 40);
    pageControl01.numberOfPages = 5;
    pageControl01.currentPage = 0;
    pageControl01.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl01.currentPageIndicatorTintColor = [UIColor blackColor];
    [pageControl01 addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    //
    
    [scrollView01 addSubview: titleButton];
    [scrollView01 addSubview: scrollView02];
    [self.view addSubview: scrollView01];
    [scrollView01 addSubview: pageControl01];
    [self initTimerFunction];
}

//图片轮播器，实现UIScrollView协议方法
//滑动下面的pageControl，值改变，图片改变
-(void) valueChanged {
    CGPoint offset =  scrollView02.contentOffset;
    offset.x = self.view.bounds.size.width * pageControl01.currentPage;
    [scrollView02 setContentOffset:offset animated:YES];
}
//开始拖动
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [timer01 invalidate];
}
//停止移动
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat offset = scrollView02.contentOffset.x;
    CGFloat pagewi = self.view.bounds.size.width;
    pageControl01.currentPage = offset / pagewi;
}
//停止拖动
-(void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [timer01 fire];
    [self initTimerFunction];
}
//计时器
-(void) initTimerFunction {
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(autoSelectPage) userInfo:nil repeats:YES];
    NSRunLoop* mainloop = [NSRunLoop mainRunLoop];
    [mainloop addTimer:timer forMode:NSRunLoopCommonModes];
    timer01 = timer;
}
//自动翻页
-(void) autoSelectPage {
    CGPoint offset =  scrollView02.contentOffset;
    NSInteger currentPage = pageControl01.currentPage;
    if (currentPage == 4) {
        currentPage = 0;
        offset = CGPointMake(0, 0);
        [scrollView02 setContentOffset:offset animated:NO];
    } else {
        currentPage += 1;
        offset.x = self.view.bounds.size.width * currentPage;
        [scrollView02 setContentOffset:offset animated:YES];
    }
    pageControl01.currentPage = currentPage;
}
//图片轮播内容结束

-(void) pressTitle: (UIButton*) titleButton {
    VCFirstNew* vcNew = [[VCFirstNew alloc] init];
    vcNew.view.backgroundColor = [UIColor lightGrayColor];
    [self.navigationController pushViewController:vcNew animated:YES];
}

-(void) pressImage: (UITapGestureRecognizer*) tap {
    UIImageView* imageView = (UIImageView*) tap.view;
    VCImageShow* imageShow = [[VCImageShow alloc] init];
    imageShow.imageTag = imageView.tag;
    [self.navigationController pushViewController: imageShow animated: YES];
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
