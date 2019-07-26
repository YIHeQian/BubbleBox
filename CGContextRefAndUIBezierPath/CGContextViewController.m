//
//  CGContextViewController.m
//  CGContextRefAndUIBezierPath
//
//  Created by fx on 2019/7/11.
//  Copyright © 2019 fxhq. All rights reserved.
//

#import "CGContextViewController.h"
#import "BubbleLayer.h"
@interface CGContextViewController ()

@end

@implementation CGContextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * test2view =  [[UIView alloc]initWithFrame:CGRectMake(50, 300, 300, 200)];
    test2view.backgroundColor = [UIColor redColor];
    BubbleLayer* cc =[[BubbleLayer alloc]initWithSize:test2view.frame.size];
    test2view.layer.mask = cc.layer;
    
    [self.view addSubview:test2view];
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
