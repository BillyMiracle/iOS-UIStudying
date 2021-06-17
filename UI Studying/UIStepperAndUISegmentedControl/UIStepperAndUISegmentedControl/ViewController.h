//
//  ViewController.h
//  UIStepperAndUISegmentedControl
//
//  Created by 张博添 on 2021/6/6.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //定义步进器对象
    //按照一定的数字来调整某个数据
    UIStepper* _stepper;
    
    //分栏控制器定义
    UISegmentedControl* _segmentedControl;
}

@property (retain, nonatomic) UIStepper* stepper;
@property (retain, nonatomic) UISegmentedControl * segmentedControl;

@end

