//
//  ScrollBar.m
//  Slider
//
//  Created by wurui on 17/1/4.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "MDFScrollBar.h"

@interface MDFScrollBar ()

@property (nonatomic,strong)UIImageView *sliderView;
@property (nonatomic,assign)CGFloat crossBarWidth;
@property (nonatomic,assign)CGFloat crossBarHeight;
@property (nonatomic,assign)CGFloat verticalBarWidth;
@property (nonatomic,assign)CGFloat verticalBarHeight;
@end

static CGFloat const kScrollBar_X = 2.5f;
static CGFloat const kScrollBar_Y = 1.5f;
static CGFloat const kCornerRadius = 2.0f;

@implementation MDFScrollBar

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubView];
    }
    return self;
    
}

- (void)setupSubView {
    
    self.backgroundColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
    self.layer.cornerRadius = kCornerRadius;
    self.clipsToBounds = YES;
    [self addSubview:self.sliderView];
}

- (void)setSliderViewColor:(UIColor *)sliderViewColor {
    
    _sliderViewColor = sliderViewColor;
    self.sliderView.backgroundColor = _sliderViewColor;
}

- (void)setSliderViewCornerRadius:(CGFloat)sliderViewCornerRadius {

    _sliderViewCornerRadius = sliderViewCornerRadius;
    self.sliderView.layer.cornerRadius = _sliderViewCornerRadius;
}

- (void)setContentSize:(CGSize)contentSize {
    
    _contentSize = contentSize;
    if (_showSize.height!=0||_showSize.width!=0) {
        [self setupFrame];
    }
}

- (void)setShowSize:(CGSize)showSize {
    
    _showSize = showSize;
    if (_contentSize.height!=0||_contentSize.width!=0) {
        [self setupFrame];
    }
}

//设置滚动条滑块的frame
- (void)setupFrame {
    
    if (self.frame.size.width>self.frame.size.height) {
        _crossBarWidth = _showSize.width / _contentSize.width * self.frame.size.width;
        _crossBarHeight = self.frame.size.height - 2 * kScrollBar_Y;
        CGRect crossSliderFrame = CGRectMake(kScrollBar_X, kScrollBar_Y, _crossBarWidth, _crossBarHeight);
        self.sliderView.frame = crossSliderFrame;
        if (self.sliderView.frame.size.width >= self.frame.size.width) {
            self.hidden = YES;
        }
    }else{
        _verticalBarHeight = _showSize.height / _contentSize.height * self.frame.size.height;
        _verticalBarWidth = self.frame.size.width - 2 * kScrollBar_Y;
        CGRect verticalSliderFrame = CGRectMake(kScrollBar_Y, kScrollBar_X, _verticalBarWidth, _verticalBarHeight);
        self.sliderView.frame = verticalSliderFrame;
        if (self.sliderView.frame.size.height >= self.frame.size.height) {
            self.hidden = YES;
        }
    }
}

//设置滚动条滑块的偏移量
- (void)setContentOffset:(CGPoint)contentOffset {
    
    _contentOffset = contentOffset;
    if (self.frame.size.width>self.frame.size.height) {
        
        CGFloat sliderWidth = 2 * kScrollBar_X + _crossBarWidth;
        CGFloat scale = _contentOffset.x / (_contentSize.width - _showSize.width);
        self.sliderView.transform = CGAffineTransformMakeTranslation(scale*(self.frame.size.width - sliderWidth), 0);
    }else{
        
        CGFloat sliderHeight = 2 * kScrollBar_X + _verticalBarHeight;
        CGFloat scale = _contentOffset.y / (_contentSize.height - _showSize.height);
        self.sliderView.transform = CGAffineTransformMakeTranslation(0, scale*(self.frame.size.height - sliderHeight));
    }
}

- (UIImageView *)sliderView {
    if (!_sliderView) {
        _sliderView = [[UIImageView alloc] init];
        _sliderView.backgroundColor = [UIColor colorWithRed:0.27 green:0.27 blue:0.27 alpha:1];
        _sliderView.layer.cornerRadius = kCornerRadius;
    }
    return _sliderView;
}

@end
