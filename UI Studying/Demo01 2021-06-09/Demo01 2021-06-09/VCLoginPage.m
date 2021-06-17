//
//  VCLoginPage.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/10.
//

#import "VCLoginPage.h"
#import "VCMainPage.h"
#import "VCFirst.h"
#import "VCThird.h"


@interface VCLoginPage ()

@end

@implementation VCLoginPage

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad {
    
    _isPresented = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //_usernamesAndPasswords = [[NSMutableDictionary alloc] init];
    
    _labelUserName = [[UILabel alloc] init];
    _labelUserName.frame = CGRectMake(20, 80, 60, 40);
    _labelUserName.text = @"账号：";
    _labelUserName.font = [UIFont systemFontOfSize: 18];
    _labelUserName.textAlignment = NSTextAlignmentLeft;
    
    _labelPassword = [[UILabel alloc] init];
    _labelPassword.frame = CGRectMake(20, 160, 60, 40);
    _labelPassword.text = @"密码：";
    _labelPassword.font = [UIFont systemFontOfSize: 18];
    _labelPassword.textAlignment = NSTextAlignmentLeft;
    
    _textfieldUserName = [[UITextField alloc] init];
    _textfieldUserName.frame = CGRectMake(80, 80,
            self.view.bounds.size.width - 100, 40);
    _textfieldUserName.placeholder = @"请输入账号";
    _textfieldUserName.borderStyle = UITextBorderStyleRoundedRect;
    
    _textfieldPassword = [[UITextField alloc] init];
    _textfieldPassword.frame = CGRectMake(80, 160,
            self.view.bounds.size.width - 100, 40);
    _textfieldPassword.placeholder = @"请输入密码";
    _textfieldPassword.borderStyle = UITextBorderStyleRoundedRect;
    _textfieldPassword.secureTextEntry = YES;
    
    
    _buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonLogin.frame = CGRectMake((self.view.bounds.size.width - 80) / 2,
                                        240, 80, 40);
    [_buttonLogin setTitle:@"登陆" forState:UIControlStateNormal];
    _buttonLogin.titleLabel.font = [UIFont systemFontOfSize:20];
    [_buttonLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    
    _buttonRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonRegister.frame = CGRectMake((self.view.bounds.size.width - 80) / 2,
                                    300, 80, 40);
    [_buttonRegister setTitle:@"注册" forState:UIControlStateNormal];
    _buttonRegister.titleLabel.font = [UIFont systemFontOfSize:20];
    [_buttonRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_labelUserName];
    [self.view addSubview:_labelPassword];
    [self.view addSubview:_buttonRegister];
    [self.view addSubview:_buttonLogin];
    [self.view addSubview:_textfieldUserName];
    [self.view addSubview:_textfieldPassword];
    //需要在视图加载完成后推出下一个视图，需要延时
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 *NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
           [self presentMainPage];
    });
}

//保存登陆信息，如果已经有登陆信息，则直接跳转主页面，无须重复登录
-(void) presentMainPage {
    _loginStatus = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt"];
    NSLog(@"%@",[_loginStatus allKeys]);
    if ([_loginStatus count] != 0) {
        UITabBarController* mainPage = [[VCMainPage alloc] init];
        mainPage.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController: mainPage animated:NO completion:nil];
    }
}

-(void) pressLogin {
    //获取输入框中的用户名文字
    NSString* strTextName = _textfieldUserName.text;
    //获取密码
    NSString* strTextPassword = _textfieldPassword.text;
    
    NSString* truePassword = [_usernamesAndPasswords objectForKey:strTextName];
    
    if([truePassword isEqualToString: strTextPassword]) {
        NSString* currentName = _textfieldUserName.text;
        NSString* currentPassword = _textfieldPassword.text;
        /*
        NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString* path = [doc stringByAppendingPathComponent:@"loginStatus.plist"];
        _loginStatus = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
        [_loginStatus removeAllObjects];
        [_loginStatus setObject:currentPassword forKey:currentName];
        [_loginStatus writeToFile:path atomically:YES];
        */
        _loginStatus = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt"];
        [_loginStatus removeAllObjects];
        [_loginStatus setObject:currentPassword forKey:currentName];
        [_loginStatus writeToFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt" atomically:YES];
        
        UITabBarController* mainPage = [[VCMainPage alloc] init];
        mainPage.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController: mainPage animated:YES completion:nil];
    } else {
        if(truePassword == nil){
            UIAlertController* alController01 = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号未注册，请先注册！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //NSLog(@"点击了失败的确认按钮");
            }];
            [alController01 addAction:confirm];
            [self presentViewController: alController01 animated:YES completion:nil];
        } else {
            UIAlertController* alController02 = [UIAlertController alertControllerWithTitle:@"提示" message:@"验证未通过，登陆失败！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //NSLog(@"点击了失败的确认按钮");
            }];
            [alController02 addAction:confirm];
            [self presentViewController: alController02 animated:YES completion:nil];
        }
    }
}

-(void) pressRegister {
    _usernamesAndPasswords = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/Users/zhangbotian/Desktop/Demo01/userAndPassword.txt"];
    if (_usernamesAndPasswords[_textfieldUserName.text]) {
        NSLog(@"已经注册");
    } else {
        UIAlertController* alController03 = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //NSLog(@"点击了失败的确认按钮");
        }];
        [alController03 addAction:confirm];
        [self presentViewController: alController03 animated:YES completion:nil];
        NSString* currentName = _textfieldUserName.text;
        NSString* currentPassword = _textfieldPassword.text;
        [_usernamesAndPasswords setObject:currentPassword forKey:currentName];
        NSLog(@"%@",currentName);
        NSLog(@"%@",[_usernamesAndPasswords allKeys]);
        [_usernamesAndPasswords writeToFile:@"/Users/zhangbotian/Desktop/Demo01/userAndPassword.txt" atomically:YES];
    }
}
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //回收键盘对象
    [_textfieldUserName resignFirstResponder];
    [_textfieldPassword resignFirstResponder];
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
