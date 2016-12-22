//
//  FirstViewController.m
//  TestBrowserImage
//
//  Created by 赵铭 on 2016/12/22.
//  Copyright © 2016年 zmMac. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomTableViewCell.h"
#import "ZZPhotoGroupView.h"
@interface FirstViewController ()<UITableViewDelegate, UITableViewDataSource, CustomTableViewCellDelegate>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * datasource;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _datasource = @[
                    @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg"],
                    @[
                      @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                      @"http://s4.51cto.com/wyfs02/M00/8B/A1/wKioL1hTceuw9H7WAAIg8nfG-90985.jpg-wh_651x-s_3945064556.jpg",],
                    @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg",
                      @"http://s4.51cto.com/wyfs02/M01/8B/A1/wKioL1hTez2QGBjJAAEBNiOBBDY178.jpg-wh_651x-s_3278301230.jpg",
                      @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                     ],
                    @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg",
                      @"http://s4.51cto.com/wyfs02/M01/8B/A1/wKioL1hTez2QGBjJAAEBNiOBBDY178.jpg-wh_651x-s_3278301230.jpg",
                      @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                      @"http://s4.51cto.com/wyfs02/M00/8B/A1/wKioL1hTceuw9H7WAAIg8nfG-90985.jpg-wh_651x-s_3945064556.jpg",],
                    @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg"],
                    @[
                        @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                        @"http://s4.51cto.com/wyfs02/M00/8B/A1/wKioL1hTceuw9H7WAAIg8nfG-90985.jpg-wh_651x-s_3945064556.jpg",],
                    @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg",
                      @"http://s4.51cto.com/wyfs02/M01/8B/A1/wKioL1hTez2QGBjJAAEBNiOBBDY178.jpg-wh_651x-s_3278301230.jpg",
                      @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                      ],
                    @[@"http://s2.51cto.com/wyfs02/M01/8B/92/wKioL1hR-tGQ-fPTAABtXDxU0dU847.jpg-wh_651x-s_1483170188.jpg",
                      @"http://s4.51cto.com/wyfs02/M01/8B/A1/wKioL1hTez2QGBjJAAEBNiOBBDY178.jpg-wh_651x-s_3278301230.jpg",
                      @"http://s4.51cto.com/wyfs02/M02/8B/A1/wKioL1hTcZew0XWOAAA-lzhQ9XY284.jpg-wh_651x-s_906321772.jpg",
                      @"http://s4.51cto.com/wyfs02/M00/8B/A1/wKioL1hTceuw9H7WAAIg8nfG-90985.jpg-wh_651x-s_3945064556.jpg",],
                    
                    ].mutableCopy;
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [UIView new];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datasource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cell";
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.delegate = self;
    }
    [cell setWithUrls:_datasource[indexPath.row]];
    return cell;
}
#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark -- CustomTableViewCellDelegate
- (void)cell:(CustomTableViewCell *)cell didClickIamgeAtIndex:(NSUInteger)index{
    
    NSMutableArray * items = @[].mutableCopy;
    NSArray * urls = cell.urls;
    UIImageView * fromView;
    for (int i = 0; i < urls.count; i++) {
        ZZPhotoGroupItem * item = [[ZZPhotoGroupItem alloc] init];
        item.largeImageURL = [NSURL URLWithString:urls[i]];
        item.thumbView = cell.imageViews[i];
        if (i == index) {
            fromView = cell.imageViews[i];
        }
        [items addObject:item];
    }
    ZZPhotoGroupView * groupView = [[ZZPhotoGroupView alloc] initWithGroupItems:items];
    [groupView presentFromImageView:fromView toContainer:self.view animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
