//
//  ViewController.h
//  ProgammingAssignment3Group6
//
//  Created by ubicomp6 on 11/19/15.
//  Copyright © 2015 UH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *TopView;
@property (weak, nonatomic) IBOutlet UIView *LeftView;
@property (weak, nonatomic) IBOutlet UIView *RightView;
@property (weak, nonatomic) IBOutlet UIView *BottomView;
@property (weak, nonatomic) IBOutlet UIView *Object;


- (void)moveViewWithGestureRecognizer: (UIPanGestureRecognizer *)panGestureRecognizer;
- (IBAction)changeBackground;
- (UIColor*) randomizeColor;
- (void)handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer;


@end

