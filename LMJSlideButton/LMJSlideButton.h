//
//  LMJSlideButton.h
//  SlideButton
//
//  Version:1.0.0
//
//  Created by MajorLi on 15/5/20.
//  Copyright © 2015年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import <UIKit/UIKit.h>

@class LMJSlideButton;



@protocol LMJSlideButtonDelegate <NSObject>

- (void)slideButton:(LMJSlideButton *)button selecteIsLeft:(BOOL)isLeft;

@end



@interface LMJSlideButton : UIView <UIScrollViewDelegate>

@property (nonatomic,assign) id <LMJSlideButtonDelegate> delegate;

@property (nonatomic,strong) NSString * tabBgImgName;
@property (nonatomic,strong) NSString * tabBtnImgName;

@property (nonatomic,assign) BOOL isLeft;

@end
