//
//  VCThird.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/9.
//

#import "VCThird.h"
#import "VCThird0101.h"
#import "VCLoginPage.h"
@interface VCThird ()

@end

@implementation VCThird
- (instancetype)init {
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"Mine.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    //self.title = @"个人中心";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:
                                UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    arrayData = [[NSMutableArray alloc] init];
    NSMutableArray* array01 = [[NSMutableArray alloc] init];
    NSString* str01 = [NSString stringWithFormat: @"我的"];
    [array01 addObject: str01];
    NSMutableArray* array02 = [[NSMutableArray alloc] initWithObjects:@"设置",@"地址管理",@"清理占用空间", @"安全中心",@"帮助与反馈",nil];
    NSMutableArray* array03 = [[NSMutableArray alloc] initWithObjects:@"退出登陆", nil];
    [arrayData addObject:array01];
    [arrayData addObject:array02];
    [arrayData addObject:array03];
    [self.view addSubview: tableView];
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numRow = [[arrayData objectAtIndex:section] count];
    return numRow;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return arrayData.count;
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }
    return 56;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellStr = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if(cell == nil) {
        //创建一个单元格
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    //将单元格的主文字内容赋值
    cell.textLabel.text = arrayData[indexPath.section][indexPath.row];
    if(indexPath.section == 2 && indexPath.row == 0) {
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    if(indexPath.section == 0 && indexPath.row == 0) {
        //cell.imageView.image = [UIImage imageNamed: @"DemoUserHeader.jpg"];
    }
    
    return cell;
}
//选中单元格
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"选中单元格！,%d,%d",indexPath.section,indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0) {
        VCThird0101* vc0101 = [[VCThird0101 alloc] init];
        vc0101.view.backgroundColor = [UIColor lightGrayColor];
        
        [self.navigationController pushViewController:vc0101 animated:YES];
    } else if (indexPath.section == 2) {
        //如果选中退出登录，则推出登录，清空登录信息，dismiss当前视图，回到登录界面。
        NSMutableDictionary* loginStatus = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt"];
        [loginStatus removeAllObjects];
        [loginStatus writeToFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt" atomically:YES];
        
        
        VCLoginPage* loginPage = [[VCLoginPage alloc] init];
        loginPage.modalPresentationStyle = UIModalPresentationFullScreen;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
