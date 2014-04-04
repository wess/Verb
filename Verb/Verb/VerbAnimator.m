//
//  VerbAnimator.m
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbAnimator.h"

@interface VerbAnimator()
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIView            *referenceView;
@property (strong, nonatomic) NSArray           *behaviors;

- (void)addBehavior:(VerbBehavior *)behavior;
@end

@implementation VerbAnimator
@synthesize gravity     = _gravity;
@synthesize collision   = _collision;

- (instancetype)initWithReferenceView:(UIView *)view animator:(UIDynamicAnimator *)animator
{
    self = [super init];
    if(self)
    {
        self.animator       = animator;
        self.referenceView  = view;
        self.behaviors      = @[];
    }
    return self;
}

- (void)addBehavior:(VerbBehavior *)behavior
{
    NSMutableArray *behaviors = [self.behaviors mutableCopy];
    [behaviors addObject:behavior];
    
    _behaviors = [behaviors copy];
}

- (void)install
{
    @weakify(self);
    [self.behaviors enumerateObjectsUsingBlock:^(VerbBehavior *behavior, NSUInteger idx, BOOL *stop) {
        @strongify(self);

        [self.animator addBehavior:behavior.behavior];

        if(behavior.childBehavior)
            [self.animator addBehavior:behavior.childBehavior];
    }];
}

#pragma mark - Getters
- (VerbCollisionBehavior *)collision
{
    if(_collision)
        return _collision;
    
    _collision = [VerbCollisionBehavior collisionBehaviorWithView:self.referenceView];
    
    [self addBehavior:_collision];
    
    return _collision;
}

- (VerbGravityBehavior *)gravity
{
    if(_gravity)
        return _gravity;
    
    _gravity = [VerbGravityBehavior gravityBehaviorWithView:self.referenceView];
    
    [self addBehavior:_gravity];
    
    return _gravity;
}

@end

