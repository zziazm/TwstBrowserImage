//
//  ViewController.m
//  TestBrowserImage
//
//  Created by zm on 2016/12/16.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "ViewController.h"
#import "YYPhotoGroupView.h"
#import "UIImageView+WebCache.h"
#import "UIView+ZZAdd.h"

@interface CustomCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView * imageView;
@property (nonatomic, assign) NSInteger index;
@end

@implementation CustomCell
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        [self addSubview:_imageView];
        _imageView.backgroundColor = [UIColor cyanColor];
    }
    return self;
}

@end



@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray * datasource;
@property (nonatomic, strong) UICollectionView * collectionView;
@property (nonatomic, strong) UIImageView * imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datasource = @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg",
                    @"http://s4.51cto.com/wyfs02/M01/8B/A1/wKioL1hTez2QGBjJAAEBNiOBBDY178.jpg-wh_651x-s_3278301230.jpg",
                    @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                    @"http://s4.51cto.com/wyfs02/M00/8B/A1/wKioL1hTceuw9H7WAAIg8nfG-90985.jpg-wh_651x-s_3945064556.jpg",
                    @"http://s2.51cto.com/wyfs02/M01/8B/A4/wKiom1hTca3jQcHyAAAxSm3ZDsM914.jpg",
                    @"http://s1.51cto.com/wyfs02/M02/8B/A1/wKioL1hTccHAZS9fAAB_fKEfh1U843.jpg",
                    @"http://s1.51cto.com/wyfs02/M00/8B/A4/wKiom1hTcdagU-1kAAChJMOjYx4100.jpg",
                   ];
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"cell"];
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(100,400, 100, 100);
    [self.view addSubview:_imageView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --  UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell * cell = (CustomCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSArray * visibleCells = collectionView.visibleCells;
    visibleCells = [visibleCells sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        CustomCell * cell1 = obj1;
        CustomCell * cell2 = obj2;
        return cell1.index > cell2.index;

    }];
    NSMutableArray * items = @[].mutableCopy;
    for (int i = 0; i < _datasource.count; i++) {
        YYPhotoGroupItem * item = [[YYPhotoGroupItem alloc] init];
        CustomCell * aCell = visibleCells[i];
        item.thumbView = aCell.imageView;
        item.largeImageSize = CGSizeZero;
        item.largeImageURL = [NSURL URLWithString:_datasource[i]];
        [items addObject:item];
    }
    YYPhotoGroupView * groupView = [[YYPhotoGroupView alloc] initWithGroupItems:items];
    [groupView presentFromImageView:cell.imageView toContainer:self.view animated:YES completion:nil];
}

#pragma mark --  UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _datasource.count;
}

#pragma mark -- UICollectionViewDelegateFlowLayout
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell * cell = (CustomCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:_datasource[indexPath.row]]];
    cell.index = indexPath.row;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
