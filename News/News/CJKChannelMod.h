//
//  CJKChannel.h
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJKChannelMod : NSObject
//频道名称
@property (nonatomic,copy) NSString *tname;
//tid,用来给频道排序,tid越小,越靠前
@property (nonatomic,copy) NSString *tid;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modWithDict:(NSDictionary *)dict;
 //获得模型数组

+(NSArray *)channelArray;

@end
