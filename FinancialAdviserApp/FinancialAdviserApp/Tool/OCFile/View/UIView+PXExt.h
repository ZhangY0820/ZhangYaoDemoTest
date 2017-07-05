//
//  UIView+PXExt.h
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/21.
//  Copyright © 2017年 PX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PXExt)

//获取视图中心点。
CGPoint CGRectGetCenter(CGRect rect);

//视图当前点，移动至中心点。返回cgrect
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);


@property CGPoint origin;

@property CGSize size;

@property (readonly) CGPoint bottomLeft;

@property (readonly) CGPoint bottomRight;

@property (readonly) CGPoint topRight;

@property CGFloat height;

@property CGFloat width;

@property CGFloat top;

@property CGFloat left;

@property CGFloat bottom;

@property CGFloat right;



- (void) moveBy: (CGPoint) delta;

- (void) scaleBy: (CGFloat) scaleFactor;

- (void) fitInSize: (CGSize) aSize;

@end
