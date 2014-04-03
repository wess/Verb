//
//  VerbGravityBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbGravityBehavior.h"
#import "VerbAnimator.h"

@interface VerbGravityBehavior()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@end

@implementation VerbGravityBehavior
+ (instancetype)gravityBehaviorWithView:(UIView *)view
{
    VerbGravityBehavior *gravity    = [[VerbGravityBehavior alloc] initWithAttachmentView:view];
    
    return gravity;
}

#pragma mark - Getters
- (UIDynamicBehavior *)behavior
{
    return self.gravity;
}

- (UIGravityBehavior *)gravity
{
    if(_gravity)
        return _gravity;
    
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.attachedView]];
    
    return _gravity;
}

- (VerbGravityBehavior *(^)(VerbDirection direction))direction
{
    @weakify(self);
    return ^(VerbDirection direction) {
        @strongify(self);
        
        self.gravity.gravityDirection = VerbVectorForDirection(direction);
        
        return self;
    };
}

- (VerbGravityBehavior *(^)(CGFloat angle))angle
{
    @weakify(self);
    return ^(CGFloat angle) {
        @strongify(self);
        self.gravity.angle = angle;
        
        return self;
    };
}

- (VerbGravityBehavior *(^)(CGFloat magnitude))magnitude
{
    @weakify(self);
    return ^(CGFloat magnitude) {
        @strongify(self);
        self.gravity.magnitude = magnitude;
        
        return self;
    };
}
@end
