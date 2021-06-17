//
//  ViewController.m
//  LoginPageExample
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
    
    //用户名提示标签创建
    _lbUserName = [[UILabel alloc] init];
    _lbUserName.frame = CGRectMake(20, 60, 80, 40);//位置
    _lbUserName.text = @"用户名：";//文字
    _lbUserName.font = [UIFont systemFontOfSize: 18];//字体大小
    _lbUserName.textAlignment = NSTextAlignmentLeft;//排版
    
    //用户密码提示
    _lbPassword = [[UILabel alloc] init];
    _lbPassword.frame = CGRectMake(20, 140, 80, 40);
    _lbPassword.text = @"密码：";
    _lbPassword.font = [UIFont systemFontOfSize: 18];
    _lbPassword.textAlignment = NSTextAlignmentLeft;
    
    //用户名输入框
    _tfUserName = [[UITextField alloc] init];
    _tfUserName.frame = CGRectMake(120, 60, 180, 40);
    _tfUserName.placeholder = @"请输入用户名";
    _tfUserName.borderStyle = UITextBorderStyleRoundedRect;
    
    //密码输入
    _tfPassword = [[UITextField alloc] init];
    _tfPassword.frame = CGRectMake(120, 140, 180, 40);
    _tfPassword.placeholder = @"请输入密码";
    _tfPassword.borderStyle = UITextBorderStyleRoundedRect;
    _tfPassword.secureTextEntry = YES;
    //_tfPassword.keyboardType = UIKeyboardTypeDefault;
    
    //登陆和注册button
    _btLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btLogin.frame = CGRectMake(120, 300, 80, 40);
    [_btLogin setTitle: @"登陆"forState:UIControlStateNormal];
    [_btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    _btRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btRegister.frame = CGRectMake(120, 360, 80, 40);
    [_btRegister setTitle: @"注册"forState:UIControlStateNormal];
    [_btRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    //将所有控件添加到视图中显示
    [self.view addSubview:_lbUserName];
    [self.view addSubview:_lbPassword];
    [self.view addSubview:_btRegister];
    [self.view addSubview:_btLogin];
    [self.view addSubview:_tfUserName];
    [self.view addSubview:_tfPassword];
    
    
    
}
//登陆事件函数
-(void) pressLogin {
    NSString* strName = @"Billy";
    NSString* strPassword = @"123456";
    //获取输入框中的用户名文字
    NSString* strTextName = _tfUserName.text;
    //获取密码
    NSString* strTextPassword = _tfPassword.text;
    
    if([strName isEqualToString: strTextName] && [strPassword isEqualToString: strTextPassword]) {
        //NSLog(@"用户名密码正确");
        UIAlertController* alController = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证通过，登陆成功！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了确认按钮");
        }];
        [alController addAction:confirm];
        
        [self presentViewController: alController animated:YES completion:nil];
    } else {
        UIAlertController* alController = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证失败，登陆失败！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了失败的确认按钮");
        }];
        [alController addAction:confirm];
        
        [self presentViewController: alController animated:YES completion:nil];
    }
    
}
//注册事件函数
-(void) pressRegister {
    
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //回收键盘对象
    [_tfUserName resignFirstResponder];
    [_tfPassword resignFirstResponder];
}



@end
