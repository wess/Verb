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
    
    [self.view addSubview:self.subView];

    UIView *barrierView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 200.0, 120.0, 10.0)];
    barrierView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:barrierView];
    
    UIView *otherView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 110.0, 100.0, 100.0)];
    otherView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:otherView];
    
    WAIT_FOR_IT(2, {
        [self.subView verb_makeAnimations:^(VerbAnimator *animator) {
            animator.referenceView(self.view);
            animator.gravity.direction(VerbDirectionDown);
            animator.collision.translatesReferenceBoundary(YES).addItem(barrierView);
            animator.dynamic.elasticity(0.4).density(1.0);
        }];
        
        [otherView verb_makeAnimations:^(VerbAnimator *animator) {
            animator.attachment.attachToItem(self.subView);
            animator.gravity.direction(VerbDirectionDown);
        }];
    });
    
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
