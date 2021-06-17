//
//  SuperView.h
//  ManuallyLayoutSubviews
//
//  Created by 张博添 on 2021/6/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuperView : UIView {
    UIView* _view01;
    UIView* _view02;
    UIView* _view03;
    UIView* _view04;
    UIView* _view05;
}
-(void) creatSubViews;
@end


NS_ASSUME_NONNULL_END
