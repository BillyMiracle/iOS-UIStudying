//
//  VCThird0101.h
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCThird0101 : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* tableView;
    NSMutableArray* arrayData;
}
@end

NS_ASSUME_NONNULL_END
