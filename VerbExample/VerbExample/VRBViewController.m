//
//  VRBViewController.m
//  VerbExample
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VRBViewController.h"
#import <Verb/Verb.h>

#define WAIT_FOR_IT(time, code) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ do { code } while(0); })

@interface VRBViewController ()
@property (strong, nonatomic) UIView            *subView;
@end

@implementation VRBViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
    }
    return self;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    [self.view addSubview:self.subView];
//
//    UIView *barrierView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 200.0, 120.0, 10.0)];
//    barrierView.backgroundColor = [UIColor blueColor];
//    
//    [self.view addSubview:barrierView];
//    
//    UIView *otherView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 110.0, 100.0, 100.0)];
//    otherView.backgroundColor = [UIColor purpleColor];
//    
//    [self.view addSubview:otherView];
//    
//    WAIT_FOR_IT(2, {
//        [self.subView verb_makeAnimations:^(VerbAnimator *animator) {
//            animator.referenceView(self.view);
//            animator.gravity.direction(VerbDirectionDown);
//            animator.collision.translatesReferenceBoundary(YES).addItem(barrierView);
//            animator.dynamicItem.elasticity(0.4).density(1.0);
//        }];
//        
//        [otherView verb_makeAnimations:^(VerbAnimator *animator) {
//            animator.attachment.attachToItem(self.subView);
//            animator.gravity.direction(VerbDirectionDown);
//        }];
//    });
//    
    
    UIView *head = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100.0, 100.0)];
    head.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:head];
    
    head.center = (CGPoint){.x = self.view.center.x, .y = 100.0};

    UIView *eyeOne = [[UIView alloc] initWithFrame:CGRectMake(20.0, 40.0, 10.0, 10.0)];
    eyeOne.backgroundColor = [UIColor blackColor];
    
    [head addSubview:eyeOne];
    
    UIView *eyeTwo = [[UIView alloc] initWithFrame:CGRectMake(head.bounds.size.width - 30.0, 40.0, 10.0, 10.0)];
    eyeTwo.backgroundColor = [UIColor blackColor];
    
    [head addSubview:eyeTwo];
    
    UIView *mouth = [[UIView alloc] initWithFrame:CGRectMake(20.0, head.bounds.size.height - 30.0, head.bounds.size.width - 40.0, 10.0)];
    mouth.backgroundColor = [UIColor blackColor];
    
    [head addSubview:mouth];
    
    UIView *neck = [[UIView alloc] initWithFrame:CGRectMake(head.frame.origin.x, head.frame.size.height + head.frame.origin.y, 20.0, 10.0)];
    neck.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:neck];
    
    neck.center = (CGPoint){.x = self.view.center.x, .y = neck.center.y};
    
    UIView *body = [[UIView alloc] initWithFrame:CGRectMake(head.frame.origin.x, neck.frame.origin.y + neck.frame.size.height, head.frame.size.width, head.frame.size.height)];
    body.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:body];
    
    UIView *leftLeg = [[UIView alloc] initWithFrame:CGRectMake(head.frame.origin.x, body.frame.size.height + body.frame.origin.y, 20.0, 100.0)];
    leftLeg.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:leftLeg];

    UIView *rightLeg = [[UIView alloc] initWithFrame:CGRectMake(head.frame.origin.x + head.frame.size.width - 20.0, body.frame.size.height + body.frame.origin.y, 20.0, 100.0)];
    rightLeg.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:rightLeg];
    
    UIView *shoulder = [[UIView alloc] initWithFrame:CGRectMake(body.frame.origin.x - 40.0, body.frame.origin.y, body.frame.size.width + 80.0, 20.0)];
    shoulder.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:shoulder];
    
    UIView *leftArm = [[UIView alloc] initWithFrame:CGRectMake(shoulder.frame.origin.x, shoulder.frame.origin.y, 20.0, 60.0)];
    leftArm.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:leftArm];

    UIView *rightArm = [[UIView alloc] initWithFrame:CGRectMake(shoulder.frame.origin.x + shoulder.frame.size.width - 20.0, shoulder.frame.origin.y, 20.0, 60.0)];
    rightArm.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:rightArm];
}

#pragma mark - Getters
- (UIView *)subView
{
    if(_subView)
        return _subView;
    
    _subView                    = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 100.0, 100.0)];
    _subView.backgroundColor    = [UIColor redColor];
    _subView.center             = (CGPoint){.x = self.view.center.x, _subView.center.y};
    
    return _subView;
}


@end
