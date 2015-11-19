//
//  ViewController.m
//  ProgammingAssignment3Group6
//
//  Created by ubicomp6 on 11/19/15.
//  Copyright © 2015 UH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize TopView, BottomView, LeftView, RightView, Object;
//test
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tapRecon = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self action:@selector(objectDoubleTap:)];
    tapRecon.numberOfTapsRequired = 2;
    [self.Object addGestureRecognizer:tapRecon];
    
}

- (BOOL)canBecomeFirstResponder{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake){
        [self changeBackground];
        
    }
}

- (IBAction)changeBackground{
    self.view.backgroundColor = [self randomizeColor];
}

- (UIColor*) randomizeColor{
    CGFloat hue = (arc4random() % 256 / 256.0);
    CGFloat saturation =(arc4random() % 128 / 256.0) + 0.5;
    CGFloat brightness =(arc4random() % 128 / 256.0) + 0.5;
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}


- (void)objectDoubleTap:(UIGestureRecognizer*)recognizer {
    //Do Stuff Here
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
