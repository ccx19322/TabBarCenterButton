//
//  HiddenTabBar.m
//  TabBarCenterButton
//
//  Created by chen cx on 2017/2/17.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import "HiddenTabBar.h"

@implementation HiddenTabBar
+ (instancetype)shareInstance{
    static HiddenTabBar * tabBar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBar = [[HiddenTabBar alloc] init];
    });
    return tabBar;
}
- (void)hiddenTabBarController:(BOOL)hidden controller:(UIViewController*)controller {
    
    [controller.tabBarController.tabBar setHidden:hidden];
    for (UIView * view in controller.tabBarController.view.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view setHidden:hidden];
        }
    }
    
}
@end
