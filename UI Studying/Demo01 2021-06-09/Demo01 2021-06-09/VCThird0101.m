//
//  VCThird0101.m
//  Demo01 2021-06-09
//
//  Created by 张博添 on 2021/6/9.
//

#import "VCThird0101.h"
#import "VCLoginPage.h"

@interface VCThird0101 ()

@end

@implementation VCThird0101

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"我的";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:
                                UITableViewStyleGrouped];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    arrayData = [[NSMutableArray alloc] init];
    NSMutableArray* array01 = [[NSMutableArray alloc] initWithObjects:@"头像",@"账号与安全",@"性别", @"地址管理",nil];
    NSMutableArray* array02 = [[NSMutableArray alloc] initWithObjects:@"注销账号", nil];
    
    [arrayData addObject:array01];
    [arrayData addObject:array02];
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
    return 56;
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellStr = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.textLabel.text = arrayData[indexPath.section][indexPath.row];
    if(indexPath.section == 1) {
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return cell;
}
//选中单元格
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"选中单元格！,%d,%d",indexPath.section,indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 1) {
        //如果选中注销账户，则推出登录，清空登录信息,注销账户，dismiss当前视图，回到登录界面。
        NSMutableDictionary* loginStatus = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt"];
        
        NSArray* currentUser = [loginStatus allKeys];
        
        NSMutableDictionary* accounts = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/Users/zhangbotian/Desktop/Demo01/userAndPassword.txt"];
        
        [accounts removeObjectForKey: currentUser[0]];
        
        [loginStatus removeAllObjects];
        [loginStatus writeToFile:@"/Users/zhangbotian/Desktop/Demo01/loginStatus.txt" atomically:YES];
        [accounts writeToFile:@"/Users/zhangbotian/Desktop/Demo01/userAndPassword.txt" atomically:YES];
        VCLoginPage* loginPage = [[VCLoginPage alloc] init];
        loginPage.modalPresentationStyle = UIModalPresentationFullScreen;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
