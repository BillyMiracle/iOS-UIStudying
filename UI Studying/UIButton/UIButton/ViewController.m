//
//  ViewController.m
//  UIButton
//
//  Created by 张博添 on 2021/6/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//创建普通按钮函数
-(void) creatUIRectButton {
    //创建一个btn对象
    //圆角类型btn：UIButtonTypeRoundedRect
    //一定通过类方法来创建buttonWithType：类名+方法名
    UIButton* btn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    
    //设置button按钮的位置
    btn.frame = CGRectMake(100, 100, 100, 40);
    
    //设置按钮的文字内容
    //@parameter
    //P1：字符串类型，显示到按钮上的文字
    //P2：设置文字显示的状态类型：UIControlStateNormal 正常状态
    [btn setTitle:@"按钮01" forState: UIControlStateNormal];
    
    //P1:显示文字
    //P2:显示文字状态：UIControlStateHighlighted 按下状态
    [btn setTitle:@"按钮按下" forState: UIControlStateHighlighted];
    
    //灰色背景颜色
    btn.backgroundColor = [UIColor grayColor];
    
    //设置文字显示的颜色
    //P1:颜色
    //P2:状态
    //[btn setTitleColor:[UIColor redColor] forState: UIControlStateNormal];
    //设置按下状态的颜色
    [btn setTitleColor:[UIColor orangeColor] forState: UIControlStateHighlighted];
    
    //设置按钮风格颜色，不分状态，优先级没有setTitleColor高
    [btn setTintColor:[UIColor whiteColor]];
    
    //titleLable实际是UILable空间
    btn.titleLabel.font = [UIFont systemFontOfSize: 18];
    
    //添加到视图中并显示
    [self.view addSubview: btn];
}

//创建一个可以显示图片的按钮
-(void) creatImageBtn {
    //创建一个自定义类型的btn
    UIButton* btnImage = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btnImage.frame = CGRectMake(100, 200, 100, 100);
    //两张图片加载
    UIImage* icon01 = [UIImage imageNamed:@"btn01.png"];
    UIImage* icon02 = [UIImage imageNamed:@"btn02.png"];
    
    //设置按钮图片方法设置
    //P1:显示的图片对象
    //P2:控件的状态
    [btnImage setImage:icon01 forState:UIControlStateNormal];
    
    [btnImage setImage:icon02 forState:UIControlStateHighlighted];
    
    [self.view addSubview: btnImage];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatUIRectButton];
    
    [self creatImageBtn];
}

@end
