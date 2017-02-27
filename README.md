# Slider
封装了一个自定义的滑动条，可以自己控制滑动条的样式。

#使用
使用起来十分简单，首先只需要将MDFScrollBar这个类导入程序。然后初始化的时候，你可以自由给你的滑动视图添加这个Slider。Slider初始化完成之后，只需要将创建的滑动视图的内容尺寸和显示尺寸传递过去，就会自动形成一个合适的滑块。滑动时，只要把偏移量传递过去，滑块就会跟随滑动。还会根据滑动视图的内容尺寸和显示尺寸判断是否显示滑动条。

<br>
例如:

    static CGFloat const scrollBarSpacing = 5.0f;

    UIScrollView *crossView = [[UIScrollView alloc] init];
    _crossView.frame = CGRectMake(50, 100, 200, 100);
    _crossView.contentSize = CGSizeMake(1000, 100);
    _crossView.showsHorizontalScrollIndicator = NO;
    _crossView.delegate = self;

    MDFScrollBar *crossBar = [[MDFScrollBar alloc] init];
    _crossBar.frame = CGRectMake(CGRectGetMinX(_crossView.frame), CGRectGetMaxY(_crossView.frame), CGRectGetWidth(_crossView.frame), scrollBarSpacing);
    _crossBar.showSize = _crossView.frame.size;
    _crossBar.contentSize = _crossView.contentSize;

    -(void)scrollViewDidScroll:(UIScrollView *)scrollView {

        _crossBar.contentOffset = _crossView.contentOffset;
    }

详见Demo
