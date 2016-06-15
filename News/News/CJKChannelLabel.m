//
//  CJKChannelLabel.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKChannelLabel.h"

@implementation CJKChannelLabel

+(instancetype)channelWithText:(NSString *)text{
    CJKChannelLabel *label=[[self alloc]init];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:18];
    label.text=text;
    //让label尺寸跟随尺寸跟随字体自动调整
    [label sizeToFit];//把label尺寸撑大
    
    label.font=[UIFont systemFontOfSize:13];
    return label;
}

@end
