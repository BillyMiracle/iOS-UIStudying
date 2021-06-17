//
//  ViewController.m
//  UITableView
//
//  Created by 张博添 on 2021/6/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建数据视图
    //P：数据视图位置
    //P2:数据视图的风格
    //UITableViewStrlePlain:普通风格
    //UITableViewStyleGrouped：分组风格
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //设置数据视图的代理对象
    _tableView.delegate = self;
    //设置数据视图的数据源对象
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    //创建一个可变数组
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 'A'; i <= 'Z'; i++) {
        //定义小数组
        NSMutableArray* arraySmall = [[NSMutableArray alloc] init];
        
        for (int j = 1; j <= 5; j++) {
            NSString* str = [NSString stringWithFormat:@"%c%d",i,j];
            [arraySmall addObject: str];
        }
        
        //生成一个二维数组
        [_arrayData addObject: arraySmall];
    }
}




//获取每组元素个数（行数）
//必须实现的协议函数
//程序在显示数据视图时会调用此函数
//返回值：每组元素个数
//P1:数据视图对象本身
//P2:每一组需要的行数
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger numRow = [[_arrayData objectAtIndex:section] count];
    
    return numRow;
}
//设置数据视图的组数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return _arrayData.count;
}
//创建单元格对象函数
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellStr = @"cell";
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:cellStr];
    if(cell == nil) {
        //创建一个单元格
        //参数一：单元格的样式
        //参数二：单元格的附用标记
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    //NSString* str = [NSString stringWithFormat:@"第%ld组，第%ld行",indexPath.section,indexPath.row];
    
    //将单元格的主文字内容赋值
    //cell.textLabel.text = str;
    cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
    
    return cell;
}
//高度
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}
//头部标题
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return @"Head Title";
}
//尾部标题
-(NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    return @"Foot Title";
}
//头部高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 50;
}
//尾部高度
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 30;
}


@end
