//
//  ScrollBar.h
//  Slider
//
//  Created by wurui on 17/1/4.
//  Copyright © 2017年 wurui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFScrollBar : UIView

@property (nonatomic,strong)UIColor *sliderViewColor;
@property (nonatomic,assign)CGFloat sliderViewCornerRadius;
/** 滑动视图的偏移量 */
@property (nonatomic,assign)CGPoint contentOffset;
/** 滑动视图的内容尺寸 */
@property (nonatomic,assign)CGSize contentSize;
/** 滑动视图的显示尺寸 */
@property (nonatomic,assign)CGSize showSize;

@end
