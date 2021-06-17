//
//  ViewController.m
//  UITableView02
//
//  Created by 张博添 on 2021/6/8.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //设置代理
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //数据视图头部视图的设定
    _tableView.tableHeaderView = nil;
    //数据视图尾部视图的设定
    _tableView.tableFooterView = nil;
    
    [self.view addSubview: _tableView];
    
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= 20; ++i) {
        NSString* str = [NSString stringWithFormat:@"A %d", i];
        
        [_arrayData addObject: str];
    }
    
    //当数据的数据源发生变化后
    //更新数据视图，重新加载数据
    [_tableView reloadData];
    
    [self creatButton];
}

-(void) creatButton {
    _isEdit = NO;
    //创建功能按钮
    _btnEdit = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
        style:UIBarButtonItemStylePlain target:self action:@selector(pressEdit)];
    _btnFinish = [[UIBarButtonItem alloc] initWithTitle:@"Finish"
        style:UIBarButtonItemStylePlain target:self action:@selector(pressFinish)];
    _btnDelete = [[UIBarButtonItem alloc] initWithTitle:@"Delete"
        style:UIBarButtonItemStylePlain target:self action:@selector(pressDelete)];
    self.navigationItem.rightBarButtonItem = _btnEdit;
    
}

//显示编辑状态，当手指在单元格上移动时
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
            forRowAtIndexPath:(NSIndexPath *)indexPath {
    //可以执行按下Delete键后的操作
    //NSLog(@"按下Delete键");
    
    //删除数据源对应的数据
    [_arrayData removeObjectAtIndex: indexPath.row];
    //数据源更新
    [_tableView reloadData];
    
    NSLog(@"Delete!");
}
//选中单元格调用此协议函数
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"选中单元格！,%d,%d",indexPath.section,indexPath.row);
    
}
//取消选中单元格调用此协议函数
-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中单元格！,%d,%d",indexPath.section,indexPath.row);
}

//单元格显示效果协议
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView
          editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //默认为删除:UITableViewCellEditingStyleDelete
    return UITableViewCellEditingStyleDelete;
    //插入状态：UITableViewCellEditingStyleInsert
    //return UITableViewCellEditingStyleInsert;
    //空状态：UITableViewCellEditingStyleNone
    //return UITableViewCellEditingStyleNone;
    //多选状态：UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert
    //return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}


-(void) pressEdit {
    _isEdit = YES;
    self.navigationItem.rightBarButtonItem = _btnFinish;
    [_tableView setEditing: YES];
    self.navigationItem.leftBarButtonItem = _btnDelete;
}

-(void) pressFinish {
    _isEdit = NO;
    self.navigationItem.rightBarButtonItem = _btnEdit;
    [_tableView setEditing: NO];
    self.navigationItem.leftBarButtonItem = nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayData.count;
}
//默认1
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* strID = @"ID";
    
    //尝试获取可以复用的单元格
    UITableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier: strID];
    if(cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
        //有子标题的风格
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strID];
    }
    
    //单元格文字赋值
    cell.textLabel.text = [_arrayData objectAtIndex: indexPath.row];
    
    cell.detailTextLabel.text = @"子标题";
    
    NSString* str = [NSString stringWithFormat:@"btn0%d.png",indexPath.row % 2 + 1];
    
    UIImage* image = [UIImage imageNamed: str];
    //UIImageView* iView = [[UIImageView alloc] initWithImage: image];
    //设置默认的图标信息
    cell.imageView.image = image;
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

@end
