//
//  CJKNewsCell.m
//  News
//
//  Created by 陈继康 on 16/6/15.
//  Copyright © 2016年 shanbay. All rights reserved.
//

#import "CJKNewsCell.h"
#import "CJKNewsMod.h"
#import <UIImageView+WebCache.h>

@interface CJKNewsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyCountLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextraBtns;
@end

@implementation CJKNewsCell

-(void)setModel:(CJKNewsMod *)model{
    _model=model;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    _titleLabel.text=model.title;
    _digestLabel.text=model.digest;
    _replyCountLabel.text=[NSString stringWithFormat:@"%@跟帖",model.replyCount];
    
    //下面这里为有三张图片的cell写的
    [model.imgextra enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //根据idx获得对应的imageView
        UIImageView *imageView=_imgextraBtns[idx];
        //取得对应的url  (这里的obj为dictionary)
        NSURL *url=[NSURL URLWithString:obj[@"imgsrc"]];
        [imageView sd_setImageWithURL:url];
    }];
}

+(CGFloat)rowHeight:(CJKNewsMod *)model{
    if (model.imgextra) {//有值就是三张图片
        return 110;
        
    }else if (model.imgType){
    
        return 150;
    } else{
        
        return 90;
    }
}

+(NSString *)idWithNewCell:(CJKNewsMod *)model{
    if (model.imgextra) {//有值就是三张图片
        return @"news3p";
        
    }else if (model.imgType){//Yes,这个就是一张大图的cell
        return @"new1p";
    } else{
        
        return @"news";
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
