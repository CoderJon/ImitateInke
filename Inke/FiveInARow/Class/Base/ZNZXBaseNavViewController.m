//
//  ZNZXBaseNavViewController.m
//  FiveInARow
//
//  Created by qiaohui on 16/12/21.
//  Copyright © 2016年 znzx@QH. All rights reserved.
//

#import "ZNZXBaseNavViewController.h"

@interface ZNZXBaseNavViewController ()

@end

@implementation ZNZXBaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.barTintColor = RGB(69, 126, 241);
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
