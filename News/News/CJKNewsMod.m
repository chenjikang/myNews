//
//  CJKNewsMod.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKNewsMod.h"
#import "CJKNetworkTool.h"

@implementation CJKNewsMod
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

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+(void)loadNewsWithSuccess:(void (^)(NSArray *newsArray))success fail:(void (^)(NSError *error))fail{
    
    NSAssert(success!=nil, @"必须传入成功回调");
    [[CJKNetworkTool shareNetworkTool] GET:@"article/headline/T1348647853363/0-20.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        //获得第一个key
        NSString *rootKey=responseObject.keyEnumerator.nextObject;
        NSArray *headLineArr=responseObject[rootKey];
        
        NSMutableArray *mArr=[NSMutableArray arrayWithCapacity:headLineArr.count];
        [headLineArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //字典转模型
            CJKNewsMod *model=[CJKNewsMod modWithDict:obj];
            [mArr addObject:model];
        }];
        //字典转模型后,成功回调
        success(mArr.copy);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
        }
    }];
    
    
}
@end
