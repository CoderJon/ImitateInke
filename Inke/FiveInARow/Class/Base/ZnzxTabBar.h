//
//  ZnzxTabBar.h
//  FiveInARow
//
//  Created by qiaohui on 16/12/21.
//  Copyright © 2016年 znzx@QH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger , ZnzxItemType) {
    ZnzxItemTypeLaunch = 10,//启动直播
    ZnzxItemTypeLive = 100,//展示直播
    ZnzxItemTypeMe,//我的
};

@class ZnzxTabBar;

typedef void(^TabBlock)(ZnzxTabBar *tabbar,ZnzxItemType idx);

@protocol ZnzxTabBarDelegate <NSObject>

- (void)tabbar:(ZnzxTabBar *)tabbar clickButton:(ZnzxItemType) idx;

@end

@interface ZnzxTabBar : UIView

@property (nonatomic,weak) id<ZnzxTabBarDelegate>delegate;
@property (nonatomic,copy) TabBlock   block;

@end
