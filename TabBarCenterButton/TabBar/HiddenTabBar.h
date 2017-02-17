//
//  HiddenTabBar.h
//  TabBarCenterButton
//
//  Created by chen cx on 2017/2/17.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HiddenTabBar : NSObject
+ (instancetype)shareInstance;
- (void)hiddenTabBarController:(BOOL)hidden controller:(UIViewController*)controller;
@end
