//
//  ZNZXMainTopView.m
//  FiveInARow
//
//  Created by qiaohui on 16/12/23.
//  Copyright © 2016年 znzx@QH. All rights reserved.
//

#import "ZNZXMainTopView.h"

@implementation ZNZXMainTopView

- (instancetype)initWithFrame:(CGRect)frame withTitles:(NSArray *)titles;
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        for (int i = 0; i < titles.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *vcName = titles[i];
            [btn setTitle:vcName forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
            btn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
            [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)titleClick:(UIButton *)button{

}

@end
