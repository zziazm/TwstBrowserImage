//
//  UIView+ZZAdd.m
//  TestProject
//
//  Created by zm on 2016/10/27.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "UIView+ZZAdd.h"

@implementation UIView (ZZAdd)
#pragma mark -- Methord
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (void)removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}
#pragma mark -- Setter And Getter
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

//#pragma mark -- Methord
//- (void)zz_removeAllSubviews{
//    while (self.subviews.count) {
//        [self.subviews.lastObject removeFromSuperview];
//    }
//}
//#pragma mark -- Setter And Getter
//
//- (CGFloat)zz_left {
//    return self.frame.origin.x;
//}
//- (void)setZz_left:(CGFloat)zz_left{
//    CGRect frame = self.frame;
//    frame.origin.x = zz_left;
//    self.frame = frame;
//}
//
//- (CGFloat)zz_top {
//    return self.frame.origin.y;
//}
//- (void)setZz_top:(CGFloat)zz_top{
//    CGRect frame = self.frame;
//    frame.origin.y = zz_top;
//    self.frame = frame;
//}
//
//- (CGFloat)zz_right {
//    return self.frame.origin.x + self.frame.size.width;
//}
//
//- (void)setZz_right:(CGFloat)zz_right{
//    CGRect frame = self.frame;
//    frame.origin.x = zz_right - frame.size.width;
//    self.frame = frame;
//
//}
//
//
//- (CGFloat)zz_bottom {
//    return self.frame.origin.y + self.frame.size.height;
//}
//
//- (void)setZz_bottom:(CGFloat)zz_bottom{
//    CGRect frame = self.frame;
//    frame.origin.y = zz_bottom - frame.size.height;
//    self.frame = frame;
//
//}
//
//- (CGFloat)zz_width {
//    return self.frame.size.width;
//}
//
//- (void)setZz_width:(CGFloat)zz_width{
//    CGRect frame = self.frame;
//    frame.size.width = zz_width;
//    self.frame = frame;
//}
//
//
//- (CGFloat)zz_height {
//    return self.frame.size.height;
//}
//
//- (void)setZz_height:(CGFloat)zz_height{
//    CGRect frame = self.frame;
//    frame.size.height = zz_height;
//    self.frame = frame;
//}
//
//- (CGFloat)zz_centerX {
//    return self.center.x;
//}
//- (void)setZz_centerX:(CGFloat)zz_centerX{
//    self.center = CGPointMake(zz_centerX, self.center.y);
//
//}
//
//- (CGFloat)zz_centerY {
//    return self.center.y;
//}
//
//- (void)setZz_centerY:(CGFloat)zz_centerY{
//    self.center = CGPointMake(self.center.x, zz_centerY);
//
//}
//
//
//- (CGPoint)zz_origin {
//    return self.frame.origin;
//}
//- (void)setZz_origin:(CGPoint)zz_origin{
//    CGRect frame = self.frame;
//    frame.origin = zz_origin;
//    self.frame = frame;
//
//}
//
//- (CGSize)zz_size {
//    return self.frame.size;
//}
//
//- (void)setZz_size:(CGSize)zz_size{
//    CGRect frame = self.frame;
//    frame.size = zz_size;
//    self.frame = frame;
//}
//
//- (UIViewController *)zz_viewController{
//    for (UIView *view = self; view; view = view.superview) {
//        UIResponder *nextResponder = [view nextResponder];
//        if ([nextResponder isKindOfClass:[UIViewController class]]) {
//            return (UIViewController *)nextResponder;
//        }
//    }
//    return nil;
//
//}

@end
