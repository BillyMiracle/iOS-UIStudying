//
//  ViewController.m
//  ManuallyLayoutSubviews
//
//  Created by 张博添 on 2021/6/7.
//

#import "ViewController.h"
#import "SuperView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建父视图
    SuperView* superView = [[SuperView alloc] init];
    superView.frame = CGRectMake(20, 20, 180, 280);
    superView.backgroundColor = [UIColor blueColor];
    superView.tag = 101;
    
    [superView creatSubViews];
    [self.view addSubview: superView];
    
    UIButton* button01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button01.frame = CGRectMake(200, 520, 80, 40);
    [button01 setTitle:@"放大" forState:UIControlStateNormal];
    [button01 addTarget:self action:@selector(pressLarge) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button01];
    
    UIButton* button02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button02.frame = CGRectMake(240, 520, 80, 40);
    [button02 setTitle:@"缩小" forState:UIControlStateNormal];
    [button02 addTarget:self action:@selector(pressSmall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button02];
}

//放大父亲视图
-(void) pressLarge {
    SuperView* superView = (SuperView*)[self.view viewWithTag:101];
    
    [UIView animateWithDuration: 1 animations:^ (void) {
        superView.frame = CGRectMake(20, 20, 320, 560);
    }];
}

//缩小父亲视图
-(void) pressSmall {
    SuperView* superView = (SuperView*)[self.view viewWithTag:101];
    
    [UIView animateWithDuration: 1 animations:^ (void) {
        superView.frame = CGRectMake(20, 20, 180, 280);
    }];
}

@end
