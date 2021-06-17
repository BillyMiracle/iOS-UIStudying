//
//  ViewController.h
//  UIAlertViewAndUIActivityIndicatorView
//
//  Created by 张博添 on 2021/6/6.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //定义一个警告对话框视图对象
    UIAlertController* _alertController;
    
    //等待提示对象
    //当下载，或加载比较大的文件时，可以显示此控件，处于提示等待状态
    UIActivityIndicatorView* _activityIndicatorView;
}

@property (retain, nonatomic) UIAlertController* alertController;
@property (retain, nonatomic) UIActivityIndicatorView* activityIndicatorView;

@end

