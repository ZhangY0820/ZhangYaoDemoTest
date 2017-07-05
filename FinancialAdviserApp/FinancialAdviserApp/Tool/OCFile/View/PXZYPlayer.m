//
//  PXZYPlayer.m
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/21.
//  Copyright © 2017年 PX. All rights reserved.
//

#import "PXZYPlayer.h"

#define kBottomViewHeight 40.0f

@interface PXZYPlayer ()

@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerItem *playItem;
@property (nonatomic, strong) AVPlayerLayer *layers;

//背景图
@property (nonatomic, strong) UIView *backView;
//顶部关闭按钮 视频标题
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UILabel *titleLabel;
//底部视图
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *playOrPauseBtn;
@property (nonatomic, strong) UISlider *progressSlider;
@property (nonatomic, strong) UIButton *fullScreenBtn;
@property (nonatomic, strong) UILabel *leftTimeLabel;
@property (nonatomic, strong) UILabel *rightTimeLabel;


@end


@implementation PXZYPlayer


- (instancetype)initWithFrame:(CGRect)frame WithVideoUrl:(NSString *)videoUrl {
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor whiteColor];
        [self getStartVideoWithUrl:videoUrl];
    }
    return self;
}

- (void)getStartVideoWithUrl:(NSString *)url {
    NSLog(@"😆");
    _playItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:url]];
    _player = [AVPlayer playerWithPlayerItem:_playItem];
    _layers = [[AVPlayerLayer alloc] initWithLayer:_player];
    _layers.frame = self.bounds;
    [self.layer addSublayer:_layers];
    [_player play];

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
