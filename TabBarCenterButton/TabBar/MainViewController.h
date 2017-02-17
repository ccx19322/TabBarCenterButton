//
//  MainViewController.h
//  TabBarCenterButton
//
//  Created by chen cx on 2017/2/17.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UITabBarController
@property (nonatomic, strong) UIButton * centerButton;
- (void)setHidden:(BOOL)hidden;
@end
