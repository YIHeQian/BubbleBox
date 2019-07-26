//
//  UIBezierPathViewController.m
//  CGContextRefAndUIBezierPath
//
//  Created by fx on 2019/7/11.
//  Copyright © 2019 fxhq. All rights reserved.
//

#import "UIBezierPathViewController.h"
#import "HQBubbleView.h"
//#import "HQBezierPath.h"
@interface UIBezierPathViewController ()
@property (nonatomic,strong)HQBubbleView * testview;
@end

@implementation UIBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    _testview = [[HQBubbleView alloc]initWithFrame:CGRectMake(50, 80, 300, 200)];
    _testview.arrowPosition = 0.8;
    _testview.arrowHeight = 18;
    _testview.image = [UIImage imageNamed:@"Doraemon.jpeg"];
//    _testview.image = [UIImage imageNamed:@"Doraemon.jpeg"];
    _testview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_testview];
    
    
   HQBubbleView * test2view =  [[HQBubbleView alloc]initWithFrame:CGRectMake(50, 300, 300, 200)];
    test2view.image = [UIImage imageNamed:@"Doraemon.jpeg"];
    test2view.NOTDraw = YES;
    test2view.layer.mask = test2view.mlayer;
    [self.view addSubview:test2view];

    
//    HQBezierPath *  Path = [[HQBezierPath alloc]initWithViewSize:_testview.frame.size];
//    Path.arrowPosition = 0;
//   _testview.layer.mask = Path.layer;
}
-(void)xx

{
    CGFloat processInfoViewHeight =200;
    CGFloat processInfoViewWidth = 300;
    UIView * processInfoView = [[UIView alloc]initWithFrame:CGRectMake(50, 80, 300, processInfoViewHeight)];
    [self.view addSubview:processInfoView];
    processInfoView.backgroundColor = [UIColor redColor];
    
    CGFloat corner = 5;
    CGFloat bottomMargin = 5;
    CGFloat arrowWidth = 5;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:CGPointMake(corner, 0)];
    [path addQuadCurveToPoint:CGPointMake(0, corner) controlPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(0, processInfoViewHeight-bottomMargin-corner)];
    [path addQuadCurveToPoint:CGPointMake(corner, processInfoViewHeight-bottomMargin) controlPoint:CGPointMake(0, processInfoViewHeight-bottomMargin)];
    [path addLineToPoint:CGPointMake(processInfoViewWidth/2-arrowWidth/2, processInfoViewHeight-bottomMargin)];
    [path addLineToPoint:CGPointMake(processInfoViewWidth/2, processInfoViewHeight)];
    [path addLineToPoint:CGPointMake(processInfoViewWidth/2+arrowWidth/2, processInfoViewHeight-bottomMargin)];
    [path  addLineToPoint:CGPointMake(processInfoViewWidth-corner, processInfoViewHeight-bottomMargin)];
    [path addQuadCurveToPoint:CGPointMake(processInfoViewWidth, processInfoViewHeight-bottomMargin-corner) controlPoint:CGPointMake(processInfoViewWidth, processInfoViewHeight-bottomMargin)];
    [path addLineToPoint:CGPointMake(processInfoViewWidth, corner)];
    [path addQuadCurveToPoint:CGPointMake(processInfoViewWidth-corner, 0) controlPoint:CGPointMake(processInfoViewWidth, 0)];
    [path closePath];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = processInfoView.bounds;
    shapeLayer.path = path.CGPath;
    
    processInfoView.layer.mask = shapeLayer;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
