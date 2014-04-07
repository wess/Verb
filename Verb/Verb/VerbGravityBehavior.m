//
//  VerbGravityBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbGravityBehavior.h"

@interface VerbGravityBehavior()
@property (strong, nonatomic) UIGravityBehavior *gravity;
@end

@implementation VerbGravityBehavior
- (UIGravityBehavior *)gravity
{
    if(_gravity)
        return _gravity;
    
    _gravity = [[UIGravityBehavior alloc] initWithItems:self.items];
    
    return _gravity;
}
- (UIDynamicBehavior *)behavior
{
    return self.gravity;
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

- (VerbGravityBehavior *(^)(id<UIDynamicItem> item))addItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item) {
        @strongify(self);
        
        [self.gravity addItem:item];
        
        return self;
    };
}

- (VerbGravityBehavior *(^)(id<UIDynamicItem> item))removeItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item) {
        @strongify(self);
        
        [self.gravity removeItem:item];
        
        return self;
    };
}

@end
