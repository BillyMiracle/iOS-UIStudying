//
//  SceneDelegate.m
//  UITabBarController02
//
//  Created by 张博添 on 2021/6/7.
//

#import "SceneDelegate.h"
#import "VCFifth.h"
#import "VCFirst.h"
#import "VCFourth.h"
#import "VCSixth.h"
#import "VCThird.h"
#import "VCSecond.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    VCFirst* vc01 = [[VCFirst alloc] init];
    VCSecond* vc02 = [[VCSecond alloc] init];
    VCThird* vc03 = [[VCThird alloc] init];
    VCFourth* vc04 = [[VCFourth alloc] init];
    VCFifth* vc05 = [[VCFifth alloc] init];
    VCSixth* vc06 = [[VCSixth alloc] init];
    
    vc01.view.backgroundColor = [UIColor blueColor];
    vc02.view.backgroundColor = [UIColor yellowColor];
    vc03.view.backgroundColor = [UIColor purpleColor];
    vc04.view.backgroundColor = [UIColor grayColor];
    vc05.view.backgroundColor = [UIColor greenColor];
    vc06.view.backgroundColor = [UIColor orangeColor];
    
    vc01.title = @"视图1";
    vc02.title = @"视图2";
    vc03.title = @"视图3";
    vc04.title = @"视图4";
    vc05.title = @"视图5";
    vc06.title = @"视图6";
    
    NSArray* arrayVC = [NSArray arrayWithObjects:vc01,vc02,vc03,vc04,vc05,vc06, nil];
    
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    
    tabBarController.viewControllers = arrayVC;
    
    tabBarController.tabBar.translucent = NO;
    
    self.window.rootViewController = tabBarController;
    
    //改变工具栏颜色
    tabBarController.tabBar.barTintColor = [UIColor redColor];
    //改变按钮颜色
    tabBarController.tabBar.tintColor = [UIColor blackColor];
    
    tabBarController.delegate = self;
    
    
}

-(void) tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(nonnull NSArray<__kindof UIViewController *> *)viewControllers {
    
    NSLog(@"编辑前");
}

-(void) tabBarController: (UITabBarController *)tabBarController willEndCustomizingViewControllers:(nonnull NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    
    NSLog(@"即将结束");
}

-(void) tabBarController: (UITabBarController *)tabBarController didEndCustomizingViewControllers:(nonnull NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed {
    
    if(changed == YES) {
        NSLog(@"发生改变");
    }
    NSLog(@"%@",viewControllers);
    NSLog(@"已经结束编辑");
}

-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    NSLog(@"%@",viewController);
    NSLog(@"选中控制器对象");
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
