//
//  ViewController.h
//  UIScrollView02
//
//  Created by 张博添 on 2021/6/7.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>{
    //当前视图控制器要实现UIScrollView的协议函数
    
    //定义一个滚动视图成员变量
    UIScrollView* _scrollView;
}



@end

