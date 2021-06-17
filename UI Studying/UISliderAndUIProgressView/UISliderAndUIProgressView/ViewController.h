//
//  ViewController.h
//  UISliderAndUIProgressView
//
//  Created by 张博添 on 2021/6/6.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //进度条对象
    //一般用来表示下载或视频播放的进度
    UIProgressView* _UIProgressView;
    
    //滑动条的定义
    //一般用来调整音乐音量等
    UISlider* _slider;
}

//定义一个进度条属性
@property (retain, nonatomic) UIProgressView* progressView;
//定义一个滑动条属性
@property (retain, nonatomic) UISlider* slider;



@end

