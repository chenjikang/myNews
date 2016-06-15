//
//  CJKHeadLineMod.h
//  News
//
//  Created by 陈继康 on 16/6/14.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJKHeadLineMod : NSObject
/*
 title	:	男子扬言打死亲生女儿 警方介入调查
 
 tag	:	photoset
 
 subtitle	:
 
 imgsrc	:	http://img2.cache.netease.com/3g/2016/6/14/20160614164337afada.jpg
 
 url	:	00AP0001|2186992

 */
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgsrc;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modWithDict:(NSDictionary *)dict;

/**
 *  加载新闻头条数据
 *   因为网络请求为异步请求,所以一般返回值为空,请求完后需要执行的操作需要放在执行回调中
 *  @param success 成功回调 (传递模型参数供外界调用)
 *  @param fail    失败回调
 */
+(void)loadHeadLineSuccess:(void (^)(NSArray *headLineModArray))success fail:(void (^)(NSError *error))fail;
@end
