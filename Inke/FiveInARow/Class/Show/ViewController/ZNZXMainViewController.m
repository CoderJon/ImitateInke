//
//  ZNZXMainViewController.m
//  FiveInARow
//
//  Created by qiaohui on 16/12/21.
//  Copyright © 2016年 znzx@QH. All rights reserved.
//

#import "ZNZXMainViewController.h"
#import "ZNZXMainTopView.h"

@interface ZNZXMainViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (nonatomic,strong) NSArray   *dataList;
@property (nonatomic,strong) ZNZXMainTopView   *topView;
@end

@implementation ZNZXMainViewController

- (ZNZXMainTopView *)topView{
    if (!_topView) {
        _topView = [[ZNZXMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) withTitles:self.dataList];
    }
    return _topView;
}

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor yellowColor];
    [self initUI];
}

- (void)initUI{
    //添加左右按钮
    [self setupNav];
    //添加子视图
    [self setupChildViewControllers];
    
}

- (void)setupChildViewControllers{
    NSArray *vcNames = @[@"ZNZXFocuseViewController",@"ZNZXHotViewController",@"ZNZXNearViewController"];
    for (int i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.dataList[i];
        //当执行这句话时，不会执行该vc的viewdidLoad
        [self addChildViewController:vc];
    }
    
    //将控制器的view,加到mainVC的scrollview上.
    
    //设置scrollview的contentsize。
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.dataList.count, 0);
    //进入主控制器，加载第一个页面
    [self scrollViewDidEndDecelerating:self.contentScrollView];
}

- (void)setupNav{
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:ZNZXIMAGE(@"find_answer_search") style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:ZNZXIMAGE(@"photo") style:UIBarButtonItemStyleDone target:nil action:nil];
}
//减速结束调用加载子控制器view的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    CGFloat offset = scrollView.contentOffset.x;
    //获取索引值
    NSInteger idx = offset / width;
    //根据索引
    UIViewController *vc = self.childViewControllers[idx];
    //判断当前vc是否执行过viewdidLoad
    if ([vc isViewLoaded]) return;
    //设置子控制器view的大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    //将子控制器的view加入scrollview
    [scrollView addSubview:vc.view];
}

@end
