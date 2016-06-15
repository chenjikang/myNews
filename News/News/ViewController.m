//
//  ViewController.m
//  News
//
//  Created by 陈继康 on 16/6/14.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "ViewController.h"
#import "CJKHeadLineMod.h"
#import "HMLoopView.h"
#import <SDCycleScrollView.h>

@interface ViewController () <SDCycleScrollViewDelegate>
@property (nonatomic,strong) NSArray *headLineModArray;

@property (strong, nonatomic) HMLoopView *headView;
@property (strong, nonatomic) SDCycleScrollView *sdView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    [self setup];
}

-(void)setup{
    //获得新闻头条数据模型
    [CJKHeadLineMod loadHeadLineSuccess:^(NSArray *headLineModArray) {
        //记录数据
        self.headLineModArray=headLineModArray;
        //显示界面
        //[self.view addSubview:self.headView];
        [self.view addSubview:self.sdView];
        
        
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(HMLoopView *)headView{
    if (_headView==nil) {
        //获取图片url数组
        NSArray *imageURLArray=[self.headLineModArray valueForKeyPath:@"imgsrc"];
        //获取图片title数组
        NSArray *titleArray=[self.headLineModArray valueForKeyPath:@"title"];
        
        
        _headView=[[HMLoopView alloc]initWithURLs:imageURLArray titles:titleArray didSelected:^(NSInteger index) {
            NSLog(@"点击了第%ld",index);
        }];
        _headView.frame=self.view.bounds;
        

        
    }
    return _headView;
}

-(SDCycleScrollView *)sdView{
    if (_sdView==nil) {
        NSArray *imageURLArray=[self.headLineModArray valueForKeyPath:@"imgsrc"];
        //获取图片title数组
        NSArray *titleArray=[self.headLineModArray valueForKeyPath:@"title"];
        
        _sdView=[SDCycleScrollView cycleScrollViewWithFrame:self.view.bounds delegate:self placeholderImage:nil];
        _sdView.imageURLStringsGroup=imageURLArray;
        _sdView.titlesGroup=titleArray;
        _sdView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    }
    return _sdView;
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

@end
