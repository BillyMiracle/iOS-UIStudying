//
//  SuperView.m
//  ManuallyLayoutSubviews
//
//  Created by 张博添 on 2021/6/7.
//

#import "SuperView.h"

@implementation SuperView

-(void) creatSubViews {
    //左上
    _view01 = [[UIView alloc] init];
    _view01.frame = CGRectMake(0, 0, 40, 40);
    _view01.backgroundColor = [UIColor orangeColor];
    [self addSubview:_view01];
    
    //右上
    _view02 = [[UIView alloc] init];
    _view02.frame = CGRectMake(self.bounds.size.width - 40,
                               0, 40, 40);
    _view02.backgroundColor = [UIColor orangeColor];
    [self addSubview:_view02];
    
    //右下
    _view03 = [[UIView alloc] init];
    _view03.frame = CGRectMake(self.bounds.size.width - 40,
                               self.bounds.size.height - 40,
                               40, 40);
    _view03.backgroundColor = [UIColor orangeColor];
    [self addSubview:_view03];
    
    //左下
    _view04 = [[UIView alloc] init];
    _view04.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    _view04.backgroundColor = [UIColor orangeColor];
    [self addSubview:_view04];
    
    //_view05 = [[UIView alloc] init];
    //_view05.frame = CGRectMake(0, 0, 40, 40);
}

//当需要重新布局时调用
//通过此函数重新设定子视图位置
//手动调整子视图的位置
-(void) layoutSubviews {
    
    [UIView animateWithDuration: 1 animations:^ (void) {
        _view01.frame = CGRectMake(0, 0, 40, 40);
        _view02.frame = CGRectMake(self.bounds.size.width - 40,
                                   0, 40, 40);
        _view03.frame = CGRectMake(self.bounds.size.width - 40,
                                   self.bounds.size.height - 40,
                                   40, 40);
        _view04.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
