//
//  HMLoopView.h
//  01-网易新闻
//
//  Created by hm04 on 16/6/14.
//  Copyright © 2016年 hm04. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMLoopView : UIView
/**
 *  根据图片数组和标题数组初始化图片轮播器
 *
 *  @param URLs   图片数组
 *  @param titles 标题数组
 *
 *  @return 图片轮播器
 */
- (instancetype)initWithURLs:(NSArray <NSString *> *)URLs titles:(NSArray <NSString *> *)titles didSelected:(void (^)(NSInteger index))didSelected;
/**
 *  定时器时间间隔
 */
@property (nonatomic, assign) NSInteger timerInterval;
/**
 *  是否开启定时器:默认是开启的
 */
@property (nonatomic, assign) BOOL enableTimer;
@end
