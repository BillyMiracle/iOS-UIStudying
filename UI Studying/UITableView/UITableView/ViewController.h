//
//  ViewController.h
//  UITableView
//
//  Created by 张博添 on 2021/6/7.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
//实现数据视图的普通协议，实现数据视图的数据代理协议
//数据视图的普通事件处理
//处理数据视图的数据代理
{
    //定义一个数据视图对象
    //数据视图用来显示大量相同格式的信息的视图
    //例如，通讯录，QQ好友，朋友圈信息
    UITableView* _tableView;
    
    //声明一个数据源
    NSMutableArray* _arrayData;
    
}
@end

