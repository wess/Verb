//
//  VerbAnimator.m
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbAnimator.h"
#import "VerbGravityBehavior.h"
#import "VerbCollisionBehavior.h"
#import "VerbDynamicItemBehavior.h"

@interface VerbAnimator()
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) UIView            *view;
@property (strong, nonatomic) UIView            *refView;
@property (strong, nonatomic) NSArray           *behaviors;

- (void)addItemBehavior:(VerbBehavior *)item;
@end

@implementation VerbAnimator
@synthesize refView = _refView;

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if(self)
    {
        self.view       = view;
        self.behaviors  = @[];
    }
    return self;
}

- (void)install
{
    [self.behaviors enumerateObjectsUsingBlock:^(VerbBehavior *behavior, NSUInteger idx, BOOL *stop) {
        [self addChildBehavior:behavior.behavior];
    }];
    
    [self.animator addBehavior:self];
}

- (void)addItemBehavior:(VerbBehavior *)item
{
    NSMutableArray *array = [self.behaviors mutableCopy];
    [array addObject:item];
    
    self.behaviors = [array copy];
}

#pragma mark - Getters
- (void(^)(UIView *view))referenceView
{
    @weakify(self);
    return ^(UIView *view) {
        @strongify(self);
        
        self.refView = view;
    };
}

- (UIDynamicAnimator *)animator
{
    if(_animator)
        return _animator;
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.refView];
    
    return _animator;
}

- (UIView *)refView
{
    if(_refView)
        return _refView;
    
    _refView = self.view.superview?: self.view;
    
    return _refView;
}

- (VerbGravityBehavior *)gravity
{
    VerbGravityBehavior *behavior = [[VerbGravityBehavior alloc] initWithItems:@[self.view]];
    [self addItemBehavior:behavior];
    
    return behavior;
}

- (VerbCollisionBehavior *)collision
{
    VerbCollisionBehavior *behavior = [[VerbCollisionBehavior alloc] initWithItems:@[self.view]];
    [self addItemBehavior:behavior];
    
    return behavior;
}

- (VerbDynamicItemBehavior *)dynamicItem
{
    VerbDynamicItemBehavior *behavior = [[VerbDynamicItemBehavior alloc] initWithItems:@[self.view]];
    [self addItemBehavior:behavior];
    
    return behavior;
}

#pragma mark - Setters
- (void)setRefView:(UIView *)refView
{
    _refView  = refView;
    _animator = nil;
}

@end

