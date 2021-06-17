//
//  ViewController.h
//  NSTimer
//
//  Created by 张博添 on 2021/6/6.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //定义一个定时器对象
    //可以在每隔固定时间发送一个信息
    //通过此消息来调用相应的时间函数
    //通过此函数可以在固定时间段来完成一个根据时间间隔的任务
    NSTimer* _timerView;
}
@property (retain, nonatomic) NSTimer* timerView;

@end

