##UIPageControl
只要将UIScrollView的pageEnabled属性设置为YES，UIScrollView会被分割成多个独立页面，里面的内容就能进行分页展示
一般会配合UIPageControl增强分页效果，UIPageControl常用属性如下 

一共有多少页
- @property(nonatomic) NSInteger numberOfPages;
当前显示的页码
- @property(nonatomic) NSInteger currentPage; 
其他页码指示器的颜色
- @property(nonatomic,retain) UIColor *pageIndicatorTintColor;
当前页码指示器的颜色
- @property(nonatomic,retain) UIColor *currentPageIndicatorTintColor;
***
如果想算出currentPage是第几个那么需要算出
比例：scrollView的x偏移值 / scrollView的宽，
为什么要这么算 如果当前是第一张图，滚动到显示第二张图显示一半的时候，那么这样就是算到滚动到第二张图了，往下以此类推的话就需要求出 比例
为什么要在 比例后面加0.5
0.3 > (int)(0.3 + 0.5) > 0
0.6 > (int)(0.6 + 0.5) > 1
小数四舍五入为整数 ： (int)(小数 + 0.5)
