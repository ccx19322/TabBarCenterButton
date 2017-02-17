//
//  MainViewController.m
//  TabBarCenterButton
//
//  Created by chen cx on 2017/2/17.
//  Copyright © 2017年 chen cx. All rights reserved.
//

#import "MainViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface MainViewController () <UITabBarControllerDelegate,UINavigationControllerDelegate>

@end

@implementation MainViewController

+ (void)initialize {
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary * selectsAttrs = [NSMutableDictionary dictionary];
    selectsAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    selectsAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    
    UITabBarItem * item = [UITabBarItem appearance];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectsAttrs forState:UIControlStateSelected];
}

- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString*)title
                    imageNamed:(NSString*)imageName
              selectImageNamed:(NSString*)selectImageName {
    
    UIImage * image = [UIImage imageNamed:imageName];
    UIImage * selectedImage = [UIImage imageNamed:selectImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childController.tabBarItem.title = title;
    childController.tabBarItem.image = image;
    childController.tabBarItem.selectedImage = selectedImage;
    
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:childController];
    [navi.navigationBar setBackgroundColor:[UIColor redColor]];
    [navi.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                 NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [navi.navigationBar setTintColor:[UIColor whiteColor]];
    
    [self addChildViewController:navi];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[[FirstViewController alloc]init] title:@"第一页" imageNamed:@"icon_tab_image_entertainment_unselect" selectImageNamed:@"icon_tab_image_entertainment_selected"];
    
    [self addChildViewController:[[ThirdViewController alloc] init] title:@"第三页" imageNamed:@"icon_tab_image_event_unselect" selectImageNamed:@"icon_tab_image_event_selected"];
    
    [self addChildViewController:[[SecondViewController alloc]init] title:@"" imageNamed:@"" selectImageNamed:@""];
    
    [self addChildViewController:[[FourthViewController alloc] init] title:@"第四页" imageNamed:@"icon_tab_image_event_unselect" selectImageNamed:@"icon_tab_image_event_selected"];
    
    [self addChildViewController:[[FifthViewController alloc] init] title:@"第五页" imageNamed:@"icon_tab_image_event_unselect" selectImageNamed:@"icon_tab_image_event_selected"];
    
    [self addCenterButton];
}

- (void)addCenterButton {
    [self addCenterButtonwithImage:@"icon_tab_image_news_unselect" selectImage:@"icon_tab_image_news_selected"];
    self.delegate = self;
    self.centerButton.selected = NO;
}

- (void)addCenterButtonwithImage:(NSString *)imageNamed
                     selectImage:(NSString *)selectImageNamed {
    UIImage * image = [UIImage imageNamed:imageNamed];
    UIImage * selectedImage = [UIImage imageNamed:selectImageNamed];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _centerButton = [UIButton new];
    _centerButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    // 设置button为适应大小
    _centerButton.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [_centerButton setImage:image forState:UIControlStateNormal];
    [_centerButton setImage:selectedImage forState:UIControlStateSelected];
    [_centerButton addTarget:self action:@selector(centerPress:) forControlEvents:UIControlEventTouchUpInside];
    // 去掉选中是的阴影
    _centerButton.adjustsImageWhenHighlighted = NO;
    // 设置Button的center 和 TabBarItem的center做对齐操作，并做处相应的上浮
    CGFloat heightDifference = image.size.height - self.tabBar.frame.size.height/2.5;
    if (heightDifference < 0) {
        _centerButton.center = self.tabBar.center;
    } else {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference;
        _centerButton.center = center;
    }
    [self.view addSubview:_centerButton];
}

- (void)centerPress:(UIButton*)button {
    self.selectedIndex = 2;
    self.centerButton.selected = YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (self.selectedIndex == 2) {
        _centerButton.selected = YES;
    } else {
        _centerButton.selected = NO;
    }
}

- (void)setHidden:(BOOL)hidden {
    _centerButton.hidden = hidden;
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
