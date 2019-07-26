//
//  HQView.h
//  CGContextRefAndUIBezierPath
//
//  Created by fx on 2019/7/11.
//  Copyright © 2019 fxhq. All rights reserved.
//使用UIBezierPath 实现

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQBubbleView : UIView
typedef NS_ENUM(NSInteger,ArrowDirection)
{
    DirecTop = 0,
    DirecRight = 1,
    DirecBottom = 2,
    DirecLeft = 3,
    
};
@property (nonatomic,strong)UIImage * image;
@property (nonatomic,strong)CAShapeLayer * mlayer;//此layer可独立此View使用，可用于label Button 等
@property (nonatomic,assign)CGSize size;//若未设置frame，必须设置size
@property (nonatomic,assign)ArrowDirection arrowDirection;//箭头所在方向
@property (nonatomic,assign)CGFloat cornerRadius;
 @property (nonatomic,assign)CGFloat arrowHeight;//箭头的高度
@property (nonatomic,assign)CGFloat arrowWidth;//箭头的宽度
@property (nonatomic,assign)CGFloat arrowPosition; //箭头位置（0-1）
@property (nonatomic,assign)CGFloat lineWidth;//线的宽度
@property (nonatomic,assign)UIColor * lineColor;//线的颜色，默认黑色
@property (nonatomic,assign)BOOL radiuArrow;//箭头是否设置圆角
@property (nonatomic,assign)BOOL NOTDraw;   //不设置或设置为NO,将自动绘制气泡边框

@end

NS_ASSUME_NONNULL_END
