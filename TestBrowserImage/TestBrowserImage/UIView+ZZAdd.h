//
//  UIView+ZZAdd.h
//  TestProject
//
//  Created by zm on 2016/10/27.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZAdd)
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.


- (UIImage *)snapshotImage;
- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
/**
 Returns the view controller that holds the view.
 */

@property (nullable, nonatomic, readonly) UIViewController *viewController;
/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */

- (void)removeAllSubviews;


//@property (nonatomic) CGFloat zz_left;        ///< Shortcut for frame.origin.x.
//@property (nonatomic) CGFloat zz_top;         ///< Shortcut for frame.origin.y
//@property (nonatomic) CGFloat zz_right;       ///< Shortcut for frame.origin.x + frame.size.width
//@property (nonatomic) CGFloat zz_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
//@property (nonatomic) CGFloat zz_width;       ///< Shortcut for frame.size.width.
//@property (nonatomic) CGFloat zz_height;      ///< Shortcut for frame.size.height.
//@property (nonatomic) CGFloat zz_centerX;     ///< Shortcut for center.x
//@property (nonatomic) CGFloat zz_centerY;     ///< Shortcut for center.y
//@property (nonatomic) CGPoint zz_origin;      ///< Shortcut for frame.origin.
//@property (nonatomic) CGSize  zz_size;        ///< Shortcut for frame.size.
//
/**
 Returns the view controller that holds the view.
 */
//@property (nullable, nonatomic, readonly) UIViewController *zz_viewController;
//
/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
//- (void)zz_removeAllSubviews;
@end
