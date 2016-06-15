//
//  HMLoopViewCell.m
//  01-网易新闻
//
//  Created by hm04 on 16/6/14.
//  Copyright © 2016年 hm04. All rights reserved.
//

#import "HMLoopViewCell.h"
#import "UIImageView+WebCache.h"

@interface HMLoopViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@end

@implementation HMLoopViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];
    }
    return self;
}

- (void)setURL:(NSURL *)URL {
    _URL = URL;
    [self.iconView sd_setImageWithURL:URL];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
}

@end
