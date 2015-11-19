//
//  ViewController.m
//  ProgammingAssignment3Group6
//
//  Created by ubicomp6 on 11/19/15.
//  Copyright © 2015 UH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollisionBehaviorDelegate>

@end

@implementation ViewController{
    UICollisionBehavior* _collision;
    UIDynamicAnimator* _animator;
}

@synthesize TopView, BottomView, LeftView, RightView, Object;
//test
- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer* tapRecon = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self action:@selector(objectDoubleTap:)];
    tapRecon.numberOfTapsRequired = 2;
    [self.Object addGestureRecognizer:tapRecon];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
                                                    initWithTarget:self action: @selector(moveViewWithGestureRecognizer:)];
    [self.Object addGestureRecognizer:panGestureRecognizer];
    
    [self.view addSubview:Object];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _collision = [[UICollisionBehavior alloc]
                 initWithItems:@[Object]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    
    UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchWithGestureRecognizer:)];
    [self.Object addGestureRecognizer:pinchGestureRecognizer];

}


- (void)moveViewWithGestureRecognizer: (UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    self.Object.center = touchLocation;
    if(Object.center.y >=960 ){
        Object.backgroundColor = [UIColor yellowColor];
    }
    else if (Object.center.y <=25){
        Object.backgroundColor = [UIColor blueColor];
        
    }
    else if (Object.center.x <=25){
        Object.backgroundColor = [UIColor greenColor];
        
    }
    
    else if (Object.center.x >=743){
        Object.backgroundColor = [UIColor purpleColor];
        
    }
    
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
    if(Object.layer.cornerRadius == 100.0f) {
        [Object.layer setCornerRadius:0.0f];
        [Object.layer setMasksToBounds:YES];
    }
    else {
        [Object.layer setCornerRadius:100.0f];
        [Object.layer setMasksToBounds:YES];
        [Object setFrame:CGRectMake(Object.frame.origin.x, Object.frame.origin.y, 100, 200)];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handlePinchWithGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    self.Object.transform = CGAffineTransformScale(self.Object.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
    [Object setFrame:CGRectMake(Object.frame.origin.x, Object.frame.origin.y, 100, 100)];
    pinchGestureRecognizer.scale = 1.0;
}



@end
