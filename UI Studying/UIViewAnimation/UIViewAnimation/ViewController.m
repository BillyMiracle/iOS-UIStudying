//
//  ViewController.m
//  UIViewAnimation
//
//  Created by 张博添 on 2021/6/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建图像视图
    _imageView = [[UIImageView alloc] init];
    
//    _imageView.frame = CGRectMake(0,
//        (self.view.bounds.size.height - self.view.bounds.size.width * 4 / 3) / 2,
//        self.view.bounds.size.width,
//        self.view.bounds.size.width * 4 / 3);
    
    _imageView.frame = CGRectMake(100, 100, 120, 160);
    _imageView.image = [UIImage imageNamed: @"Demo0101.jpg"];
    
    [self.view addSubview: _imageView];
    
    UIButton* buttonMove = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    buttonMove.frame = CGRectMake(120, 360, 80, 40);
    [buttonMove setTitle:@"MOVE" forState:UIControlStateNormal];
    [buttonMove addTarget:self action:@selector(pressMove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: buttonMove];
    
    UIButton* buttonScale = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    buttonScale.frame = CGRectMake(120, 400, 80, 40);
    [buttonScale setTitle:@"ZOOM" forState:UIControlStateNormal];
    [buttonScale addTarget:self action:@selector(pressScale) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: buttonScale];
}


-(void) pressMove {
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        _imageView.frame = CGRectMake(300, 100, 120, 160);
    } completion:^(BOOL finished) {
        NSLog(@"END");
    }];
    
}


-(void) pressScale {
    
    [UIView animateWithDuration:2 delay:2 options:nil animations:^(void) {
        _imageView.frame = CGRectMake(300, 100, 150, 200);
        _imageView.alpha = 0.3;
    } completion:^(BOOL finished) {
        NSLog(@"END");
    }];
    
    
}


@end
