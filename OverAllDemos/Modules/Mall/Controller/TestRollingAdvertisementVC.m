//
//  TestRollingAdvertisementVC.m
//  OverAllDemos
//
//  Created by Rickie_Lambert on 2018/8/24.
//  Copyright © 2018年 RickieLambert. All rights reserved.
//

#import "TestRollingAdvertisementVC.h"

#import "GYRollingNoticeView.h"
#import "TestRollingAdvertisementTextCell.h"
#import "TestRollingAdvertisementImageAndTextCell.h"
#import "TestRollingAdvertisementCustomCell.h"

@interface TestRollingAdvertisementVC ()<GYRollingNoticeViewDataSource, GYRollingNoticeViewDelegate>
{
    // 两个广告数组
    NSArray *_arrAds;
    NSArray *_arrTips;
    
    GYRollingNoticeView *_noticeViewAds;
    GYRollingNoticeView *_noticeViewTips;
}

@end

@implementation TestRollingAdvertisementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    float widthMainView = [[UIScreen mainScreen] bounds].size.width;
    UILabel *lblInstruction = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, widthMainView, 100)];
    lblInstruction.numberOfLines = 0;
    lblInstruction.text = @"滚动公告、广告，支持自定义cell，模仿淘宝头条等等。 \nUITableViewCell重用理念，支持请Star!";
    [self.view addSubview:lblInstruction];
    
    
    
    _arrAds = @[
              @{@"arr": @[
                            @{@"tag": @"手机", @"title": @"01小米千元全面屏：抱歉，久等！625献上"},
                            @{@"tag": @"萌宠", @"title": @"01可怜狗狗被抛弃，苦苦等候主人半年"}
                        ],
                @"img": @"tb_icon2"},
              @{@"arr": @[
                            @{@"tag": @"手机", @"title": @"02三星中端新机改名，全面屏火力全开"},
                            @{@"tag": @"围观", @"title": @"02主人假装离去，狗狗直接把孩子推回去了"}
                        ],
                @"img": @"tb_icon3"},
              @{@"arr": @[
                            @{@"tag": @"园艺", @"title": @"03学会这些，这5种花不用去花店买了"},
                            @{@"tag": @"手机", @"title": @"03华为nova2S发布，剧透了荣耀10？"}
                        ],
                @"img": @"tb_icon5"},
              @{@"arr": @[
                            @{@"tag": @"开发", @"title": @"04iOS 内购最新讲解"},
                            @{@"tag": @"博客", @"title": @"04技术博客那些事儿"}
                        ],
                @"img": @"tb_icon6"},
              @{@"arr": @[
                            @{@"tag": @"招聘", @"title": @"05招聘XX高级开发工程师"},
                            @{@"tag": @"资讯", @"title": @"05如何写一篇好的技术博客"}
                        ],
                @"img": @"tb_icon7"}
              ];
    _arrTips = @[
                 @"01小米千元全面屏：抱歉，久等！625献上",
                 @"02可怜狗狗被抛弃，苦苦等候主人半年",
                 @"03三星中端新机改名，全面屏火力全开",
                 @"04学会这些，这5种花不用去花店买了",
                 @"05华为nova2S发布，剧透了荣耀10？"
                 ];
    
    [self creatRollingViewWithArray:_arrAds isFirst:YES];
    [self creatRollingViewWithArray:_arrTips isFirst:NO];
    
    
    // 刷新数据源  reload datasource test ok
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        _arr1 = @[@"0", @"1", @"2", @"3", @"4", @"5"];
    ////        _arr1 = @[@"0"];
    //        [_noticeView1 reloadDataAndStartRoll];
    //    });
}


// 请在合适的时机 停止
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_noticeViewAds stopRoll];
    [_noticeViewTips stopRoll];
}


- (void)creatRollingViewWithArray:(NSArray *)arr isFirst:(BOOL)isFirst
{
    float widthScreenW = [[UIScreen mainScreen] bounds].size.width;
    CGRect frame = CGRectMake(0, 150, widthScreenW, 50);
    if (!isFirst) {
        frame = CGRectMake(0, 250, widthScreenW, 30);
    }
    
    GYRollingNoticeView *noticeView = [[GYRollingNoticeView alloc] initWithFrame:frame];
    noticeView.dataSource = self;
    noticeView.delegate = self;
    [self.view addSubview:noticeView];
    noticeView.backgroundColor = [UIColor lightGrayColor];
    
    if (isFirst) {
        _noticeViewAds = noticeView;
        [noticeView registerClass:[TestRollingAdvertisementImageAndTextCell class] forCellReuseIdentifier:@"TestRollingAdvertisementImageAndTextCell"];
        [noticeView registerClass:[TestRollingAdvertisementCustomCell class] forCellReuseIdentifier:@"TestRollingAdvertisementCustomCell"];
//        [noticeView registerNib:[UINib nibWithNibName:@"CustomNoticeCell" bundle:nil] forCellReuseIdentifier:@"CustomNoticeCell"];
//        [noticeView registerNib:[UINib nibWithNibName:@"DemoCell3" bundle:nil] forCellReuseIdentifier:@"DemoCell3"];
        
    } else {
        _noticeViewTips = noticeView;
//        [noticeView registerClass:[GYNoticeViewCell class] forCellReuseIdentifier:@"GYNoticeViewCell"];
//        [noticeView registerClass:[DemoCell2 class] forCellReuseIdentifier:@"DemoCell2"];
        [noticeView registerClass:[GYNoticeViewCell class] forCellReuseIdentifier:@"GYNoticeViewCell"];
        [noticeView registerClass:[TestRollingAdvertisementTextCell class] forCellReuseIdentifier:@"TestRollingAdvertisementTextCell"];
    }
    
    [noticeView reloadDataAndStartRoll];
}


- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView
{
    if (rollingView == _noticeViewAds) {
        return _arrAds.count;
    }
    
    if (rollingView == _noticeViewTips) {
        return _arrTips.count;
    }
    
    return 0;
}


- (GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    if (rollingView == _noticeViewAds) {
        if (index < 3) {
            TestRollingAdvertisementImageAndTextCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"TestRollingAdvertisementImageAndTextCell"];
            [cell noticeCellWithArr:_arrAds forIndex:index];
            return cell;
        } else {
            TestRollingAdvertisementCustomCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"TestRollingAdvertisementCustomCell"];
            NSDictionary *dic = _arrAds[index];
            cell.lab0.text = [dic[@"arr"] firstObject][@"title"];
            cell.lab1.text = [dic[@"arr"] lastObject][@"title"];
            return cell;
        }
    }
    
    // 普通用法，只有一行label滚动显示文字
    // normal use, only one line label rolling
    if (rollingView == _noticeViewTips) {
        if (index < 3) {
            GYNoticeViewCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"GYNoticeViewCell"];
            cell.textLabel.text = [NSString stringWithFormat:@"第1种cell %@", _arrTips[index]];
            cell.contentView.backgroundColor = [UIColor orangeColor];
            if (index % 2 == 0) {
                cell.contentView.backgroundColor = [UIColor greenColor];
            }
            return cell;
        } else {
            TestRollingAdvertisementTextCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"TestRollingAdvertisementTextCell"];
            cell.customLab.text = [NSString stringWithFormat:@"第2种cell %@", _arrTips[index]];
            cell.contentView.backgroundColor = [UIColor cyanColor];
            return cell;
        }
    }
    return nil;
}


- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index
{
    NSLog(@"------ did selected click %ld", index);
}

@end
