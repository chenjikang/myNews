//
//  CJKNetworkTool.m
//  News
//
//  Created by 陈继康 on 16/6/14.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKNetworkTool.h"

@implementation CJKNetworkTool



+(instancetype)shareNetworkTool{
    
    static CJKNetworkTool *instance;
    static dispatch_once_t onceToken;
    //确保只执行一次初始化代码
    dispatch_once(&onceToken, ^{
        //http://c.m.163.com/nc/ad/headline/0-4.html
        //initWithBaseURL 是父类的方法,以后传地址的时候比较方便
        NSURL *baseURL=[NSURL URLWithString:@"http://c.m.163.com/nc/"];
        instance=[[super alloc]initWithBaseURL:baseURL];
        instance.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    });
    return instance;

}



@end
