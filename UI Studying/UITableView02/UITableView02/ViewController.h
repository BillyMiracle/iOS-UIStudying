//
//  ViewController.h
//  UITableView02
//
//  Created by 张博添 on 2021/6/8.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    //定义一个数据视图对象
    UITableView* _tableView;
    //声明一个数据源
    NSMutableArray* _arrayData;
    //添加导航按钮
    UIBarButtonItem* _btnEdit;
    UIBarButtonItem* _btnFinish;
    UIBarButtonItem* _btnDelete;
    //设置编辑状态
    BOOL _isEdit;
}
@end
