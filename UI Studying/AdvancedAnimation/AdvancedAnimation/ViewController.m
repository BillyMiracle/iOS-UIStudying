//
//  ViewController.m
//  AdvancedAnimation
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
    
    _parentView = [[UIView alloc] init];
    
    _parentView.frame = CGRectMake(40, 80, 260, 380);
    
    [self.view addSubview: _parentView];
    
    _parentView.backgroundColor = [UIColor orangeColor];
    
    _imageView01 = [[UIImageView alloc] init];
    
    _imageView01.frame = CGRectMake(0, 0, 260, 380);
    
    _imageView01.image = [UIImage imageNamed:@"Demo0101.jpg"];
    
    _imageView02 = [[UIImageView alloc] init];
    
    _imageView02.frame = CGRectMake(0, 0, 260, 380);
    
    _imageView02.image = [UIImage imageNamed:@"Demo0102.jpg"];
    
    [_parentView addSubview: _imageView01];
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self animMove];
    
}
-(void) animMove {
    
}

@end
