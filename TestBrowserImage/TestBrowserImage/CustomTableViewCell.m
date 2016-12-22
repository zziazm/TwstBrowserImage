//
//  CustomTableViewCell.m
//  TestBrowserImage
//
//  Created by 赵铭 on 2016/12/22.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+ZZAdd.h"
#import "UIView+WebCache.h"

static NSInteger imageViewPadding = 5;
static NSInteger cellHeight = 100;
static NSInteger cellWidth = 320;
@implementation CustomTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSMutableArray * imageViews = @[].mutableCopy;
        for (int i = 0; i < 4; i++) {
            UIImageView * imageView = [UIImageView new];
            [self addSubview:imageView];
            [imageViews addObject:imageView];
        }
        self.imageViews = imageViews;

    }
    return self;
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSUInteger i = [self imageIndexForPoint:point];
    if (i != NSNotFound) {
        if ([self.delegate respondsToSelector:@selector(cell:didClickIamgeAtIndex:)]) {
            [self.delegate cell:self didClickIamgeAtIndex:i];
        }
    }

}

- (NSUInteger)imageIndexForPoint:(CGPoint)point{
    for (int i = 0; i < 4; i++) {
        UIImageView * imageView = _imageViews[i];
        if (!imageView.hidden && CGRectContainsPoint(imageView.frame, point)) {
            return i;
         }
    }
    return NSNotFound;
}

- (void)setWithUrls:(NSArray<NSString *>*)urls{
    self.urls = urls;
    for (int i = 0; i < 4; i++) {
        UIImageView * imageView = self.imageViews[i];
        if (i >= urls.count) {
            imageView.hidden = YES;
            [imageView sd_cancelCurrentImageLoad];
        }else{
            imageView.hidden = NO;
            [imageView sd_setImageWithURL:[NSURL URLWithString:urls[i]] placeholderImage:nil completed:nil];
        }
    }
    switch (urls.count) {
        case 1:
        {
            UIImageView * imageView = _imageViews[0];
            imageView.frame = self.bounds;
            imageView.width = cellWidth;
            imageView.height = cellHeight;
        }
            break;
            
        case 2:{
            UIImageView * view0 = _imageViews[0];
            view0.origin = CGPointZero;
            view0.width = (cellWidth - imageViewPadding)/2;
            view0.height = cellHeight;
            
            UIImageView * view1 = _imageViews[1];
            view1.top = 0;
            view1.size = view0.size;
            view1.right = cellWidth;
        }
            break;
        case 3:{
            UIImageView * view0 = _imageViews[0];
            view0.origin = CGPointZero;
            view0.width = (cellWidth - imageViewPadding)/2;
            view0.height = cellHeight;
            
            UIImageView * view1 = _imageViews[1];
            view1.top = 0;
            view1.width = view0.width;
            view1.right = cellWidth;
            view1.height = (cellHeight - imageViewPadding)/2;
            
            UIImageView * view2 = _imageViews[2];
            view2.size = view1.size;
            view2.bottom = cellHeight;
            view2.right = cellWidth;
        }
            break;
        case 4:{
            UIImageView * view0 = _imageViews[0];
            view0.origin = CGPointZero;
            view0.width = (cellWidth - imageViewPadding)/2;
            view0.height = (cellHeight - imageViewPadding)/2;
            
            UIImageView * view1 = _imageViews[1];
            view1.size = view0.size;
            view1.top = 0;
            view1.right = cellWidth;
            
            UIImageView * view2 = _imageViews[2];
            view2.size = view0.size;
            view2.left = 0;
            view2.bottom = cellHeight;
            
            UIImageView * view3 = _imageViews[3];
            view3.size = view0.size;
            view3.right = cellWidth;
            view3.bottom = cellHeight;
        }
            break;
        default:
            break;
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
