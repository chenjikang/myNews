//
//  CJKNewsVc.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKNewsVc.h"
#import "CJKNewsMod.h"
#import "CJKNewsCell.h"

@interface CJKNewsVc ()
@property (nonatomic,strong) NSArray *newsModArray;

@end

@implementation CJKNewsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
}
//加载数据
-(void)setup{
    [CJKNewsMod loadNewsWithSuccess:^(NSArray *newsArray) {
        self.newsModArray=newsArray;
        //刷新表格
        [self.tableView reloadData];
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsModArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取得模型
    CJKNewsMod *model=self.newsModArray[indexPath.row];
    //根据模型取得不同的id标示,在根据id标示取得不同cell
    CJKNewsCell *cell=[tableView dequeueReusableCellWithIdentifier:[CJKNewsCell idWithNewCell:model]];
    //赋值数据
    cell.model=model;
    
    return cell;
}

//根据不同cell调整行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获得模型
    CJKNewsMod *model=self.newsModArray[indexPath.row];
    return [CJKNewsCell rowHeight:model];
   }

@end
