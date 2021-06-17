//
//  ViewController.m
//  UIAlertViewAndUIActivityIndicatorView
//
//  Created by 张博添 on 2021/6/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize alertController = _alertController;
@synthesize activityIndicatorView = _activityIndicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < 2; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        button.frame = CGRectMake(100, 100 + 100 * i, 100, 40);
        
        if (i == 0) {
            [button setTitle:@"警告对话框" forState:UIControlStateNormal];
        } else if (i == 1) {
            [button setTitle:@"等待指示器" forState:UIControlStateNormal];
        }
        
        button.tag = 101 + i;
        
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview: button];
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}

-(void) pressButton: (UIButton*) button {
    if (button.tag == 101) {//警告对话框
        //创建警告对话框
        //P1:标题
        //P2:弹框的消息内容
        //P3:弹框样式：UIAlertControllerStyleAlert
        _alertController = [UIAlertController alertControllerWithTitle:@"警告" message:@"你的手机电量过低" preferredStyle:UIAlertControllerStyleAlert];
        
        //添加按钮动作
        //1.确认按钮
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了确认按钮");
        }];
        //2.取消按钮
        UIAlertAction* cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消按钮");
        }];
        
        //将动作按钮添加到控制器中
        [_alertController addAction:confirm];
        [_alertController addAction:cancle];
        
        //添加文本框
        [_alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请填写反馈信息";
        }];
        
        // 显示弹框
        [self presentViewController: _alertController animated:YES completion:nil];
        
        
    } else if (button.tag == 102) {//创建等待提示器
        //宽度和高度不可变更
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 300, 80, 80)];
        
        //设置提示的风格
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
        
        [self.view addSubview:_activityIndicatorView];
        
        //启动动画并显示
        [_activityIndicatorView startAnimating];
        //停止等待动画并隐藏
        //[_activityIndicatorView stopAnimating];
    }
}



@end
