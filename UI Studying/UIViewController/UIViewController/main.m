//
//  main.m
//  UIViewController
//
//  Created by 张博添 on 2021/6/5.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//整个app程序的主函数，入口函数
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    //自动内存释放池
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        //一个字符串
    }
    //UIApplicationMain：UIKit函数结构的启动函数
    //参数一：argc，启动时带有参数的个数
    //参数二：argv，参数列表
    //参数三：要求传入一个主框架类对象，如果参数为nil，系统会自动用默认框架类作为主框架类名
    //参数四：主框架的代理类对象名字
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
