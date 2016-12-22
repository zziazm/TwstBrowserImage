//
//  CustomTableViewCell.h
//  TestBrowserImage
//
//  Created by 赵铭 on 2016/12/22.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTableViewCell;
@protocol  CustomTableViewCellDelegate <NSObject>

@optional
- (void)cell:(CustomTableViewCell *)cell didClickIamgeAtIndex:(NSUInteger)index;

@end


@interface CustomTableViewCell : UITableViewCell
@property (nonatomic, copy) NSArray <UIImageView *> * imageViews;
@property (nonatomic, copy) NSArray <NSString *>*urls;
@property (nonatomic, weak) id<CustomTableViewCellDelegate> delegate;
- (void)setWithUrls:(NSArray<NSString *>*)urls;
@end
