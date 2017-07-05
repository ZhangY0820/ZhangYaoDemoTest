//
//  PXPlayer.h
//  FinancialAdviserApp
//
//  Created by 张垚 on 2017/6/21.
//  Copyright © 2017年 PX. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;
@import AVKit;

//获取设备的物理宽高
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

typedef NS_ENUM(NSInteger, UIPXPlayerSizeType) {
    UIPXPlayerSizeFullScreenType     = 0, //全屏
    UIPXPlayerSizeSmallScreenType    = 1,//小屏
    UIPXPlayerSizeDetailScreenType   = 2,//详情页面显示
    UIPXPlayerSizeRecoveryScreenType = 3//恢复大小
};

typedef NS_ENUM(NSInteger, UIPXPlayerStatusChangeType) {
    UIPXPlayerStatusLoadingType          = 0, //正在加载
    UIPXPlayerStatusReadyToPlayTyep      = 1,//开始播放
    UIPXPlayeStatusrLoadedTimeRangesType = 2//开始缓存
};

extern NSString *const kPXPlayerFinishedPlayNotificationKey; //播放完成通知
extern NSString *const kPXPlayerCloseVideoNotificationKey; //关闭播放视图通知
extern NSString *const kPXPlayerCloseDetailVideoNotificationKey; //关闭详情播放视图
extern NSString *const kPXPlayerFullScreenBtnNotificationKey;//全屏通知
extern NSString *const kPXPlayerPopDetailNotificationKey;//退出详情页面通知

//请求成功
typedef void (^PlayerStatusChange) (UIPXPlayerStatusChangeType status);
typedef void (^PlayerAnimateFinish) (void);


@interface PXPlayer : UIView


@property (strong, nonatomic)PlayerStatusChange status;//播放状态

@property(nonatomic,copy) NSString *videoURLStr;//播放地址
@property (assign, nonatomic)UIPXPlayerSizeType screenType;//播放类型

- (id)initWithFrame:(CGRect)frame videoURLStr:(NSString *)videoURLStr;//初始化 传入播放地址

- (void)play;//播放
- (void)setPlayTitle:(NSString *)str;//播放标题显示

-(void)toFullScreenWithInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;//全屏播放
-(void)reductionWithInterfaceOrientation:(UIView *)view;
-(void)toDetailScreen:(UIView *)view;//详情界面播放
-(void)toSmallScreen;//小屏播放
-(void)releaseWMPlayer;//释放内存
-(void)colseTheVideo:(UIButton *)sender;//关闭播放

@end
