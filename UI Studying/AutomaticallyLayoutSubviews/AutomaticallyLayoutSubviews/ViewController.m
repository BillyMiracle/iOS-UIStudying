//
//  ViewController.m
//  AutomaticallyLayoutSubviews
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
    
    _superView = [[UIView alloc] init];
    _superView.frame = CGRectMake(20, 20, 180, 280);
    _superView.backgroundColor = [UIColor blueColor];
    
    _lable01 = [[UILabel alloc] init];
    _lable01.frame = CGRectMake(0, 0, 40, 40);
    _lable01.text = @"1";
    _lable01.backgroundColor = [UIColor greenColor];
    
    _lable02 = [[UILabel alloc] init];
    _lable02.frame = CGRectMake(180-40, 0, 40, 40);
    _lable02.text = @"2";
    _lable02.backgroundColor = [UIColor greenColor];
    
    _lable03 = [[UILabel alloc] init];
    _lable03.frame = CGRectMake(180-40, 280-40, 40, 40);
    _lable03.text = @"3";
    _lable03.backgroundColor = [UIColor greenColor];
    
    _lable04 = [[UILabel alloc] init];
    _lable04.frame = CGRectMake(0, 280-40, 40, 40);
    _lable04.text = @"4";
    _lable04.backgroundColor = [UIColor greenColor];
    
    [_superView addSubview:_lable01];
    [_superView addSubview:_lable02];
    [_superView addSubview:_lable03];
    [_superView addSubview:_lable04];
    
    [self.view addSubview:_superView];
    
    _viewCenter = [[UIView alloc] init];
    _viewCenter.frame = CGRectMake(0, 0, _superView.bounds.size.width, 40);
    _viewCenter.center = CGPointMake(180/2, 280/2);
    _viewCenter.backgroundColor =[UIColor orangeColor];
    
    [_superView addSubview: _viewCenter];
    //自动布局属性
    _viewCenter.autoresizingMask =UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin |
        UIViewAutoresizingFlexibleBottomMargin;
    //视图距离父亲视图的左侧可以变化
    _lable02.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    
    _lable03.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    _lable04.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL isLarge = NO;
    
    if(isLarge == NO) {
        [UIView animateWithDuration: 1 animations:^ (void) {
            _superView.frame = CGRectMake(20, 20, 300, 480);
        }];
    } else {
        [UIView animateWithDuration: 1 animations:^ (void) {
            _superView.frame = CGRectMake(20, 20, 180, 280);
        }];
    }
    
    isLarge = !isLarge;
}



@end
