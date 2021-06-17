//
//  VCSecond.h
//  38.MultiInterfaces
//
//  Created by 张博添 on 2021/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//定义一个视图控制器二的协议
@protocol VCSecondDelegate <NSObject>
//定义一个协议函数，改变背景颜色
-(void) changeColer:(UIColor*) color;

@end


@interface VCSecond : UIViewController

@property(assign,nonatomic) NSInteger tag;
//定义一个代理对象
//代理对象会执行协议函数
//通过代理对象实现协议函数，达到代理对象改变本身属性的目的
//代理对象一定实现代理协议
@property(assign,nonatomic) id<VCSecondDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
