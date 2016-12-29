//
//  ZnzxTabBar.m
//  FiveInARow
//
//  Created by qiaohui on 16/12/21.
//  Copyright © 2016年 znzx@QH. All rights reserved.
//

#import "ZnzxTabBar.h"

@interface ZnzxTabBar ()

@property (nonatomic,strong) UIImageView *tabbgView;
@property (nonatomic,strong) NSArray   *dataList;
@property (nonatomic,strong) NSArray   *selDataList;
@property (nonatomic,strong) UIButton  *lastItem;
@property (nonatomic,strong) UIButton  *carmaButton;

@end

@implementation ZnzxTabBar

- (UIButton *)carmaButton{
    if (!_carmaButton) {
        _carmaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_carmaButton setImage:ZNZXIMAGE(@"icon_wen") forState:UIControlStateNormal];
        [_carmaButton sizeToFit];
        _carmaButton.tag = ZnzxItemTypeLaunch;
        [_carmaButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _carmaButton;
}

- (UIImageView *)tabbgView{
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc] initWithImage:ZNZXIMAGE(@"bg_tab")];
    }
    return _tabbgView;
}

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"logo1_09",@"logo1_03"];
    }
    return _dataList;
}

- (NSArray *)selDataList{
    if (!_selDataList) {
        _selDataList = @[@"logo2_09",@"logo2_03"];
    }
    return _selDataList;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //装载背景
        [self addSubview:self.tabbgView];
        //装载item
        for (int i = 0; i < self.dataList.count; i ++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:ZNZXIMAGE(self.dataList[i]) forState:UIControlStateNormal];
            [item setImage:ZNZXIMAGE(self.selDataList[i]) forState:UIControlStateSelected];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = ZnzxItemTypeLive + i;
            if (i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            [self addSubview:item];
            
        }
        //添加直播按钮
        [self addSubview:self.carmaButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.tabbgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width / self.dataList.count;
    
    for (int i = 0; i < [self subviews].count; i ++) {
        UIView *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - ZnzxItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
    self.carmaButton.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height - 40);
}

- (void)clickItem:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickButton:)]) {
        [self.delegate tabbar:self clickButton:button.tag];
    }
    
//    !self.block?:self.block(self,button.tag);
    if (self.block) {
        self.block(self,button.tag);
    }
    
    if (button.tag == ZnzxItemTypeLaunch) {
        return;
    }
    
    self.lastItem.selected = NO;
    button.selected = YES;
    self.lastItem = button;
    
    //设置动画
    [UIView animateWithDuration:0.2 animations:^{
        //将button扩大1.2倍
        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //恢复原始状态
            button.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
