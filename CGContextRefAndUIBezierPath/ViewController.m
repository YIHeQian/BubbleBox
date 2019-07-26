//
//  ViewController.m
//  CGContextRefAndUIBezierPath
//
//  Created by fx on 2019/7/11.
//  Copyright © 2019 fxhq. All rights reserved.
//

#import "ViewController.h"
#import "UIBezierPathViewController.h"
#import "CGContextViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)CGContextBtnClick:(id)sender {
    CGContextViewController * vc = [CGContextViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)UIBezierPathBtnClick:(id)sender {
    UIBezierPathViewController * vc = [UIBezierPathViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
