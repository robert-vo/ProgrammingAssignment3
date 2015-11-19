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

- (void)objectDoubleTap:(UIGestureRecognizer*)recognizer {
    //Do Stuff Here
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
