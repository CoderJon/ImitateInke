//
//  ZnzxTabBarController.m
//  FiveInARow
//
//  Created by qiaohui on 16/12/21.
//  Copyright © 2016年 znzx@QH. All rights reserved.
//

#import "ZnzxTabBarController.h"
#import "ZnzxTabBar.h"
#import "ZNZXBaseNavViewController.h"
#import "ZNZXLauchViewController.h"

@interface ZnzxTabBarController ()<ZnzxTabBarDelegate>

@property (nonatomic,strong) ZnzxTabBar   *znzxTabbar;

@end

@implementation ZnzxTabBarController

- (ZnzxTabBar *)znzxTabbar{
    
    if (!_znzxTabbar) {
        _znzxTabbar = [[ZnzxTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _znzxTabbar.delegate = self;
    }
    return _znzxTabbar;
}

- (void)tabbar:(ZnzxTabBar *)tabbar clickButton:(ZnzxItemType)idx{
    if (idx != ZnzxItemTypeLaunch) {
        self.selectedIndex = idx - ZnzxItemTypeLive;
        return;
    }
    
    ZNZXLauchViewController *launchVC = [[ZNZXLauchViewController alloc] init];
    [self presentViewController:launchVC animated:YES completion:^{
        
    }];
    
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //加载控制器
    [self configViewcontrollers];
    
    //加载tabbar
    [self.tabBar addSubview:self.znzxTabbar];

    //删除tabbar的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
}

- (void)configViewcontrollers{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"ZNZXMainViewController",@"ZNZXMeViewController"]];
    for (int i = 0; i < array.count; i ++) {
        NSString *vcName = array[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        
        ZNZXBaseNavViewController *nav = [[ZNZXBaseNavViewController alloc] initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
    }
    self.viewControllers = array;
}

@end
