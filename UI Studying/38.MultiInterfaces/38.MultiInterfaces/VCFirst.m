//
//  VCFirst.m
//  38.MultiInterfaces
//
//  Created by 张博添 on 2021/6/9.
//

#import "VCFirst.h"
#import "VCSecond.h"
@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}


//推出视图控制器二
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    VCSecond* vc = [[VCSecond alloc] init];
    vc.view.backgroundColor = [UIColor lightGrayColor];
    
    //将当前的控制器做为代理对象赋值
    //代理对象为当前视图
    //代理对象必须实现代理协议
    vc.delegate = self;
    
    //推出视图控制器二
    [self.navigationController pushViewController:vc animated:YES];
}

-(void) changeColer:(UIColor *)color {
    
    
    self.view.backgroundColor = color;
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
