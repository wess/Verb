//
//  VerbCollisionBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbCollisionBehavior.h"

@interface VerbCollisionBehavior()
@property (strong, nonatomic) UICollisionBehavior *collision;
@end

@implementation VerbCollisionBehavior
+ (instancetype)collisionBehaviorWithView:(UIView *)view
{
    VerbCollisionBehavior *collision = [[VerbCollisionBehavior alloc] initWithAttachmentView:view];
    
    return collision;
}

#pragma mark - Getters
- (UIDynamicBehavior *)behavior
{
    return self.collision;
}

- (UICollisionBehavior *)collision
{
    if(_collision)
        return _collision;
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.attachedView]];
    
    return _collision;
}

- (VerbCollisionBehavior *(^)(UIBezierPath *path))boundaryPath
{
    @weakify(self);
    return ^(UIBezierPath *path) {
        @strongify(self);
        
        [self.collision addBoundaryWithIdentifier:nil forPath:path];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;

        return self;
    };
}

-(VerbCollisionBehavior *(^)(CGRect rect))boundaryRect
{
    @weakify(self);
    return ^(CGRect rect) {
        @strongify(self);
        
        [self.collision addBoundaryWithIdentifier:nil forPath:[UIBezierPath bezierPathWithRect:rect]];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(CGPoint fromPoint, CGPoint toPoint))boundaryPoints
{
    @weakify(self);
    return ^(CGPoint fromPoint, CGPoint toPoint) {
        @strongify(self);
        
        [self.collision addBoundaryWithIdentifier:nil fromPoint:fromPoint toPoint:toPoint];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(UICollisionBehaviorMode mode))mode
{
    @weakify(self);
    return ^(UICollisionBehaviorMode mode) {
        @strongify(self);
        
        self.collision.collisionMode = mode;
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(UIEdgeInsets insets))insets
{
    @weakify(self);
    return ^(UIEdgeInsets insets) {
        @strongify(self);
        
        [self.collision setTranslatesReferenceBoundsIntoBoundaryWithInsets:insets];
        
        return self;
    };
}

@end
