//
//  CJKChannelCell.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKChannelCell.h"
#import "CJKNewsVc.h"

@interface CJKChannelCell ()
@property (nonatomic,strong) CJKNewsVc *vc;
@end

@implementation CJKChannelCell

-(void)awakeFromNib{
    //创建新闻控制器
    UIStoryboard *sb=[UIStoryboard storyboardWithName:@"CJKNewsVc" bundle:nil];
   self.vc= sb.instantiateInitialViewController;
    //将控制器的vc添加到cell上
    //避免发生 控制器view还在,而控制器不在了//所以要个强引用property (nonatomic,strong) CJKNewsVc *vc;

    [self.contentView addSubview:self.vc.view];
}

-(void)layoutSubviews{
    //在这里设置从storyboard加载的view的大小,等于cell的bounds,(注意这是scrollview的现象)
    self.vc.view.frame=self.bounds;
}

@end
