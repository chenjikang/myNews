//
//  CJKNetworkTool.h
//  News
//
//  Created by 陈继康 on 16/6/14.
//  Copyright © 2016年 shanbay. All rights reserved.
/*
 创建一个单例来管理网络请求
 */

#import <AFNetworking/AFNetworking.h>

@interface CJKNetworkTool : AFHTTPSessionManager

+(instancetype)shareNetworkTool;



@end
