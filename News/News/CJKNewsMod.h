//
//  CJKNewsMod.h
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJKNewsMod : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *imgsrc;
/**
 *  新闻摘要
 */
@property (nonatomic,copy) NSString *digest;
/**
 *  跟帖数
 */
@property (nonatomic,copy)NSString *replyCount;
/**
 *  多图标记
 */
@property (nonatomic,strong)NSArray *imgextra;
/**
 *  大图标记
 */
@property (nonatomic,assign) BOOL imgType;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modWithDict:(NSDictionary *)dict;
+(void)loadNewsWithSuccess:(void (^)(NSArray *newsArray))success fail:(void (^)(NSError *error))fail;
@end
