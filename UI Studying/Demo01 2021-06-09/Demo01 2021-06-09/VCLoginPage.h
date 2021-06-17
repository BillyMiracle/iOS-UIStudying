//
//  VCLoginPage.h
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCLoginPage : UIViewController {
    
    //用户名提示label
    UILabel* _labelUserName;
    //密码提示label
    UILabel* _labelPassword;
    //用户名输入框
    UITextField* _textfieldUserName;
    //密码输入框
    UITextField* _textfieldPassword;
    //登陆按钮
    UIButton* _buttonLogin;
    //注册按钮
    UIButton* _buttonRegister;
    
    NSMutableDictionary* _usernamesAndPasswords;
    
    NSMutableDictionary* _loginStatus;
}
@property (nonatomic, assign) BOOL isPresented;
@end

NS_ASSUME_NONNULL_END
