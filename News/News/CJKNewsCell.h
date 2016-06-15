//
//  CJKNewsCell.h
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CJKNewsMod;
@interface CJKNewsCell : UITableViewCell
@property (nonatomic,strong)CJKNewsMod *model;
//根据模型返回cell的高度
+(CGFloat)rowHeight:(CJKNewsMod *)model;
//根据模型返回标示
+(NSString *)idWithNewCell:(CJKNewsMod *)model;
@end
