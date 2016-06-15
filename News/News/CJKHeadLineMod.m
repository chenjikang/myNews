//
//  CJKHeadLineMod.m
//  News
//
//  Created by 陈继康 on 16/6/14.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKHeadLineMod.h"
#import "CJKNetworkTool.h"

@implementation CJKHeadLineMod

-(instancetype)initWithDict:(NSDictionary *)dict{
    self=[super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

//因为用不到所有的属性,所以重写这个方法防止报错
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}


+(void)loadHeadLineSuccess:(void (^)(NSArray *headLineModArray))success fail:(void (^)(NSError *error))fail{
    NSAssert(success!=nil, @"成功回调不能为nil");
    //能这么写是因为设置了baseURL
    [[CJKNetworkTool shareNetworkTool] GET:@"ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //获得第一个key
        NSString *rootKey=responseObject.keyEnumerator.nextObject;
        NSArray *headLineArr=responseObject[rootKey];
        
        NSMutableArray *mArr=[NSMutableArray arrayWithCapacity:headLineArr.count];
        [headLineArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //字典转模型
            CJKHeadLineMod *model=[CJKHeadLineMod modWithDict:obj];
            [mArr addObject:model];
        }];
        //字典转模型后,成功回调
        success(mArr.copy);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败回调
        if(fail){
            fail(error);
        }
    }];
    
}


@end
