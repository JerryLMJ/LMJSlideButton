//
//  ViewController.m
//  SlideButton
//
//  Created by LiMingjie on 16/1/26.
//  Copyright © 2016年 iOS开发者公会. All rights reserved.
//

#import "ViewController.h"

#import "LMJSlideButton.h"

@interface ViewController () <LMJSlideButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    LMJSlideButton * slideBtn = [[LMJSlideButton alloc] initWithFrame:CGRectMake(20, 80, 120, 55)];
    slideBtn.tabBgImgName = @"tab_bg";
    slideBtn.tabBtnImgName = @"tabBtn";
    slideBtn.isLeft = NO;
    slideBtn.delegate = self;
    [self.view addSubview:slideBtn];
}

#pragma mark - LMJSlideButton Delegate
- (void)slideButton:(LMJSlideButton *)button selecteIsLeft:(BOOL)isLeft{
    NSLog(@"滑到了：%@边",isLeft ? @"左":@"右");
}
@end
