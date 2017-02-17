//
//  ViewController.m
//  TabBarCenterButton
//
//  Created by chen cx on 2017/2/17.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import "ViewController.h"
#import "HiddenTabBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[HiddenTabBar shareInstance] hiddenTabBarController:YES controller:self];
    self.tabBarController.tabBar.bounds = CGRectMake(0, 0, 0, 0);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[HiddenTabBar shareInstance] hiddenTabBarController:NO controller:self];
    self.tabBarController.tabBar.frame = CGRectMake(0, CGRectGetHeight(self.view.bounds)-44, CGRectGetWidth(self.view.bounds), 44);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
