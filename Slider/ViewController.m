//
//  ViewController.m
//  Slider
//
//  Created by wurui on 17/1/4.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import "ViewController.h"
#import "MDFScrollBar.h"

static CGFloat const scrollBarSpacing = 5.0f;

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *crossView;
@property (nonatomic, strong)UIScrollView *verticalView;
@property (nonatomic, strong)MDFScrollBar *crossBar;
@property (nonatomic, strong)MDFScrollBar *verticalBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr = @[[UIColor blueColor],[UIColor orangeColor],[UIColor redColor]];
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(300 * i, 0, 300, 200)];
        imageView.backgroundColor = arr[i];
        [self.crossView addSubview:imageView];
    }
    
    NSArray *arr1 = @[[UIColor blueColor],[UIColor orangeColor],[UIColor redColor]];
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300 * i, 200, 300)];
        imageView.backgroundColor = arr1[i];
        [self.verticalView addSubview:imageView];
    }
    
    [self setupFrame];
    [self.view addSubview:self.crossView];
    [self.view addSubview:self.crossBar];
    [self.view addSubview:self.verticalView];
    [self.view addSubview:self.verticalBar];
}

- (void)setupFrame {
    
    CGRect crossViewFrame = CGRectMake(50, 100, 200, 100);
    self.crossView.frame = crossViewFrame;
    
    CGRect crossBarFrame = CGRectMake(CGRectGetMinX(crossViewFrame), CGRectGetMaxY(crossViewFrame), CGRectGetWidth(crossViewFrame), scrollBarSpacing);
    self.crossBar.frame = crossBarFrame;
    
    self.crossBar.contentSize = self.crossView.contentSize;
    self.crossBar.showSize = self.crossView.frame.size;
    
    CGRect verticalViewFrame = CGRectMake(50, 350, 100, 200);
    self.verticalView.frame = verticalViewFrame;
    
    CGRect verticalBarFrame = CGRectMake(CGRectGetMaxX(verticalViewFrame), CGRectGetMinY(verticalViewFrame), scrollBarSpacing, CGRectGetHeight(verticalViewFrame) - 50);
    self.verticalBar.frame = verticalBarFrame;
    
    self.verticalBar.contentSize = self.verticalView.contentSize;
    self.verticalBar.showSize = self.verticalView.frame.size;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {

    self.crossBar.contentOffset = self.crossView.contentOffset;
    self.verticalBar.contentOffset = self.verticalView.contentOffset;
}

#pragma mark --set && get
- (UIScrollView *)crossView {
    if (!_crossView) {
        _crossView = [[UIScrollView alloc] init];
        _crossView.contentSize = CGSizeMake(1000, 100);
        _crossView.showsHorizontalScrollIndicator = NO;
        _crossView.delegate = self;
    }
    return _crossView;
}

- (UIScrollView *)verticalView {
    if (!_verticalView) {
        _verticalView = [[UIScrollView alloc] init];
        _verticalView.contentSize = CGSizeMake(100, 1000);
        _verticalView.showsVerticalScrollIndicator = NO;
        _verticalView.delegate = self;
    }
    return _verticalView;
}

- (MDFScrollBar *)crossBar {
    if (!_crossBar) {
        _crossBar = [[MDFScrollBar alloc] init];
    }
    return _crossBar;
}

- (MDFScrollBar *)verticalBar {
    if (!_verticalBar) {
        _verticalBar = [[MDFScrollBar alloc] init];
    }
    return  _verticalBar;
}

@end
