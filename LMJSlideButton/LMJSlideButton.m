//
//  LMJSlideButton.m
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

#import "LMJSlideButton.h"

#define SliderBtnWith  self.bounds.size.width/2

@implementation LMJSlideButton

{
    UIImageView * _bgImgView;     // 控件背景
    UIImageView * _tabBtnImgView; // 滑动按钮图片
    
    UIScrollView * _slideViewBtn; // 滑动scrollView
}

- (id)init{
    self = [super init];
    if (self) {
        
        [self buildView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self buildView];
    }
    return self;
}

- (void)buildView{
    
    // 背景图片
    _bgImgView = [[UIImageView alloc] initWithFrame:self.bounds];
    [self addSubview:_bgImgView];
    
    // 滑动按钮scrollView
    _slideViewBtn = [[UIScrollView alloc] initWithFrame:self.bounds];
    _slideViewBtn.contentSize                    = CGSizeMake(SliderBtnWith *3, self.bounds.size.height);
    _slideViewBtn.showsHorizontalScrollIndicator = NO;
    _slideViewBtn.bounces                        = NO;
    _slideViewBtn.delegate                       = self;
    [self addSubview:_slideViewBtn];
    
    _tabBtnImgView = [[UIImageView alloc] initWithFrame:CGRectMake(SliderBtnWith, 0, SliderBtnWith, self.bounds.size.height)];
    [_slideViewBtn addSubview:_tabBtnImgView];
}
#pragma mark - Set Methods
- (void)setTabBgImgName:(NSString *)tabBgImgName{
    [_bgImgView setImage:[UIImage imageNamed:tabBgImgName]];
}
- (void)setTabBtnImgName:(NSString *)tabBtnImgName{
    [_tabBtnImgView setImage:[UIImage imageNamed:tabBtnImgName]];
}
- (void)setIsLeft:(BOOL)isLeft{
    if (isLeft) {
        [self moveToLeftWithAnimation];
    }else{
        [self moveToRightWithAnimation];
    }
}


#pragma mark - UIScrollView Delegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    CGPoint point = scrollView.contentOffset;
    if ( point.x < SliderBtnWith/2 ) {
        [self moveToRightWithAnimation];
        
    }else if ( point.x >= SliderBtnWith/2 ) {
        [self moveToLeftWithAnimation];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGPoint point = scrollView.contentOffset;
    if ( point.x <= 1) { // 1是间隙
        
        if ([self.delegate respondsToSelector:@selector(slideButton:selecteIsLeft:)]) {
            [self.delegate slideButton:self selecteIsLeft:NO];  // 回调 回传滑动按钮状态 右
        }
        
    }else if ( point.x >= SliderBtnWith-1) {
        
        if ([self.delegate respondsToSelector:@selector(slideButton:selecteIsLeft:)]) {
            [self.delegate slideButton:self selecteIsLeft:YES]; // 回调 回传滑动按钮状态 左
        }
    }
}


- (void)moveToLeftWithAnimation{
    
    [UIView animateWithDuration:0.25f animations:^{
        
        _slideViewBtn.contentOffset = CGPointMake(SliderBtnWith, 0);
    }];
    
}
- (void)moveToRightWithAnimation{
    
    [UIView animateWithDuration:0.25f animations:^{
        
        _slideViewBtn.contentOffset = CGPointMake(0, 0);
    }];
    
}

@end
