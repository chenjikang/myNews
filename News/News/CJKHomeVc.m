//
//  CJKHomeVc.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKHomeVc.h"
#import "CJKChannelMod.h"
#import "CJKChannelLabel.h"
#import "CJKChannelCell.h"

@interface CJKHomeVc () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UIScrollView *channelView;

@property (weak, nonatomic) IBOutlet UICollectionView *channelCollectionV;

@property (nonatomic,strong) NSArray *channelArray;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;
@end

@implementation CJKHomeVc

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //设置scrollview
    [self setupChannelView];
    
}
//当控制器的frame布局好子控件时调用
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //设置下面的cell
    [self setuplayout];
}


-(void)setuplayout{
    self.flowlayout.itemSize=self.channelCollectionV.bounds.size;
}


-(void)setupChannelView{
    //不需要自动调整scrollview的内间距
    self.automaticallyAdjustsScrollViewInsets=NO;
    
   __block CGFloat labelX=0;
    [self.channelArray enumerateObjectsUsingBlock:^(CJKChannelMod *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //创建label
        CJKChannelLabel *label=[CJKChannelLabel channelWithText:obj.tname];
        //设置frame
        
        label.frame=CGRectMake(labelX, 0, label.frame.size.width, self.channelView.bounds.size.height);
        
        [self.channelView addSubview:label];
        labelX=labelX+label.frame.size.width;
    }];
    //设置滚动范围
    self.channelView.contentSize=CGSizeMake(labelX, 0);
}

//collectionView数据源方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.channelArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CJKChannelCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"channel" forIndexPath:indexPath];
   // cell.backgroundColor=[UIColor greenColor];
    
    return cell;
}



-(NSArray *)channelArray{
    if (_channelArray==nil) {
        _channelArray=[CJKChannelMod channelArray];
    }
    return _channelArray;
}

@end
