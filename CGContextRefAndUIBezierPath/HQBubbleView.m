//
//  HQView.m
//  CGContextRefAndUIBezierPath
//
//  Created by fx on 2019/7/11.
//  Copyright © 2019 fxhq. All rights reserved.
//

#import "HQBubbleView.h"
@interface HQBubbleView()
@property (nonatomic,strong)NSMutableArray *points;
@property (nonatomic,strong)NSMutableArray *Controllerpoints;

@end
@implementation HQBubbleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.size = frame.size;
        [self setDefaultProperty];

    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    
    if (self.image) {
        [self.image drawInRect:rect];
    }
    if (!self.NOTDraw) {
        [self creatPath];
     }
}

-(CAShapeLayer *)mlayer;
{
    CAShapeLayer * layer =  [CAShapeLayer layer];
    layer.path =  [self creatPath];
    return layer;
}
-(CGPathRef)creatPath
{
    UIBezierPath * path = [UIBezierPath bezierPath];
    path.lineWidth =  self.lineWidth ;
    path.lineJoinStyle = kCGLineJoinMiter;//路径的连接点（拐角）形状。
     [self getPoints];//
    if (!(self.points.count > 0 && self.Controllerpoints.count > 0)) {
        return path.CGPath;
    }
    [path moveToPoint:[self.points[0] CGPointValue]];
    for (int i = 1; i < self.points.count; i++) {
        if ((i >= 3) && (i%2 == 0) ) {
            [path addQuadCurveToPoint:[self.points[i] CGPointValue]  controlPoint:[self.Controllerpoints[(i-3)/2] CGPointValue]];

         }else
         {
             if (i == 1 && _radiuArrow) {
                 [path addQuadCurveToPoint:[self.points[i+1] CGPointValue]  controlPoint:[self.points[i] CGPointValue]];
                 i++;

             }
             [path addLineToPoint:[self.points[i] CGPointValue]];

         }
    }
    [path closePath];
    [_lineColor set];
 
    [path stroke];
    
    return path.CGPath;
}

// 获取所有点  箭头的三个点和矩形的四个角的点
-(void)getPoints
{
    self.points = [NSMutableArray array];
    self.Controllerpoints = [NSMutableArray array];

    // 先确定箭头的三个点
    CGPoint beginPoint;  //0 按顺时针画箭头时的第一个支点，例如箭头向上时的左边的支点
    CGPoint topPoint; // 顶点 1
    CGPoint endPoint;  // 另外一个支点 2
    //箭头所在线条剩余长度
    CGFloat tpXRange = _size.width - 2 * _cornerRadius - _arrowWidth;
    CGFloat tpYRange = _size.height - 2 * _cornerRadius - _arrowWidth;
    
    // 这几个参数用于确定矩形框的位置(就是给箭头腾出空间后剩下的区域)
    // 这些参数在下面会根据箭头的位置进行调整
    CGFloat x = _lineWidth, y = _lineWidth;  // 矩形框左上角的坐标
    CGFloat width = _size.width - _lineWidth * 2, height = _size.height - _lineWidth *2; //矩形框的大小
    switch (self.arrowDirection) {
        case DirecTop:
            topPoint = CGPointMake(tpXRange * _arrowPosition + _cornerRadius + _arrowWidth/2, 0);
            beginPoint =CGPointMake( topPoint.x - _arrowWidth/2, _arrowHeight);
            endPoint = CGPointMake(beginPoint.x + _arrowWidth, beginPoint.y);
            y = _arrowHeight;
            height = height - _arrowHeight;
            break;
        case DirecRight:
            topPoint = CGPointMake(_size.width, tpYRange * _arrowPosition + _cornerRadius + _arrowWidth/2);
            beginPoint =CGPointMake( topPoint.x - _arrowHeight , topPoint.y - _arrowWidth/2);
            endPoint = CGPointMake(beginPoint.x , beginPoint.y + _arrowWidth);
            width = width - _arrowHeight;
            break;
        case DirecLeft:
            topPoint = CGPointMake(0, tpYRange * _arrowPosition + _cornerRadius + _arrowWidth/2);
            beginPoint =CGPointMake( topPoint.x + _arrowWidth , topPoint.y - _arrowWidth/2);
            endPoint = CGPointMake(beginPoint.x , beginPoint.y + _arrowWidth);
            width = width - _arrowHeight;
            x = _arrowHeight;
            break;
        case DirecBottom:
            topPoint = CGPointMake(tpXRange * _arrowPosition + _cornerRadius + _arrowWidth/2, 0);
            beginPoint =CGPointMake( topPoint.x + _arrowWidth/2, _size.height -_arrowHeight);
            endPoint = CGPointMake(beginPoint.x - _arrowWidth, beginPoint.y);
            height = height - _arrowHeight;
            break;
        default:
            break;
    }
    self.points = [NSMutableArray arrayWithObjects:[NSValue valueWithCGPoint:beginPoint],
              [NSValue valueWithCGPoint:topPoint],
              [NSValue valueWithCGPoint:endPoint],  nil];
    
    
    CGPoint topLeft = CGPointMake(x, y);//c2
    CGPoint topRight = CGPointMake(x+width, y);//c3
    CGPoint bottomRight = CGPointMake(x+width, y+height); //右下角的点 c4
    CGPoint bottomLeft = CGPointMake(x, y+height);//c1
    //1 2 为顺时针方向
    CGPoint topLeft1 = CGPointMake(topLeft.x, topLeft.y+_lineWidth+_cornerRadius);
    CGPoint topLeft2 =CGPointMake(topLeft.x+_lineWidth+_cornerRadius, topLeft.y);
    CGPoint topRight1 = CGPointMake(topRight.x - _lineWidth-_cornerRadius , topRight.y);
    CGPoint topRight2 =CGPointMake(topRight.x , topRight.y+_lineWidth+_cornerRadius);
    CGPoint bottomRight1 = CGPointMake(bottomRight.x, bottomRight.y-_lineWidth-_cornerRadius);
    CGPoint bottomRight2 =CGPointMake(bottomRight.x-_lineWidth-_cornerRadius, bottomRight.y);
    CGPoint bottomLeft1 = CGPointMake(bottomLeft.x+_lineWidth+_cornerRadius, bottomLeft.y);
    CGPoint bottomLeft2 =CGPointMake(bottomLeft.x, bottomLeft.y-_lineWidth-_cornerRadius);
#define NSValue(value) [NSValue valueWithCGPoint:value]
    
    NSMutableArray *ControllPoints = [NSMutableArray arrayWithObjects:
                                  [NSValue valueWithCGPoint:topRight],
                                  [NSValue valueWithCGPoint:bottomRight],
                                  [NSValue valueWithCGPoint:bottomLeft],
                                  [NSValue valueWithCGPoint:topLeft],
                                  nil];
    NSMutableArray *rectPoints = [NSMutableArray arrayWithObjects:
                                  NSValue(topRight1),
                                  NSValue(topRight2),
                                  NSValue(bottomRight1),
                                  NSValue(bottomRight2),
                                  NSValue(bottomLeft1),
                                  NSValue(bottomLeft2),
                                  NSValue(topLeft1),
                                  NSValue(topLeft2),
                                   nil];
    
    int rectPointIndex = (int)_arrowDirection;
    for(int i=0; i<4; i++) {
        [self.Controllerpoints addObject:[ControllPoints objectAtIndex:rectPointIndex]];
        [self.points addObject:[rectPoints objectAtIndex:rectPointIndex*2]];
        [self.points addObject:[rectPoints objectAtIndex:rectPointIndex*2 + 1]];

        rectPointIndex = (rectPointIndex+1)%4;
    }
 }
// 设置默认参数
- (void)setDefaultProperty {
    
    _cornerRadius = 10;
    _arrowWidth = 20;
    _arrowHeight = 8;
    _arrowDirection = 1;
    _arrowPosition = 0.5;
     _lineWidth =  1;
    _NOTDraw = NO;
    _lineColor = [UIColor blackColor];
    _radiuArrow = NO;
}
@end
