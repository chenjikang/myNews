//
//  CJKChannel.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKChannelMod.h"

@implementation CJKChannelMod
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

+(NSArray *)channelArray{
    NSString *filepath=[[NSBundle mainBundle]pathForResource:@"topic_news" ofType:@"json"];
    NSData *data=[NSData dataWithContentsOfFile:filepath];
    //转字典
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSString *rootkey=dict.keyEnumerator.nextObject;
    NSArray *array=dict[rootkey];
    NSMutableArray *mArr=[NSMutableArray arrayWithCapacity:array.count];
    
    [array enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CJKChannelMod *model=[CJKChannelMod modWithDict:obj];
        [mArr addObject:model];
    }];
    
    //在返回之前排序
 NSArray *arr= [mArr sortedArrayUsingComparator:^NSComparisonResult(CJKChannelMod *  _Nonnull obj1, CJKChannelMod *  _Nonnull obj2) {
      return [obj1.tid compare:obj2.tid];
  }];
    
    return arr;
    
}

@end
