//
//  VerbCollisionBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbCollisionBehavior.h"

@interface VerbCollisionBehavior()
@property (strong, nonatomic) UICollisionBehavior *collision;
@end

@implementation VerbCollisionBehavior
- (UICollisionBehavior *)collision
{
    if(_collision)
        return _collision;
    
    _collision = [[UICollisionBehavior alloc] initWithItems:self.items];
    
    return _collision;
}

- (UIDynamicBehavior *)behavior
{
    return self.collision;
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

- (VerbCollisionBehavior *(^)(NSString *identifier, UIBezierPath *path))boundaryPath
{
    @weakify(self);
    return ^(NSString *identifier, UIBezierPath *path) {
        @strongify(self);
        
        [self.collision addBoundaryWithIdentifier:identifier forPath:path];
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(NSString *identifier, CGRect rect))boundaryRect
{
    @weakify(self);
    return ^(NSString *identifier, CGRect rect) {
        @strongify(self);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
        [self.collision addBoundaryWithIdentifier:identifier forPath:path];
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(NSString *identifier, CGPoint from, CGPoint to))boundaryPoints
{
    @weakify(self);
    return ^(NSString *identifier, CGPoint from, CGPoint to) {
        @strongify(self);
        
        [self.collision addBoundaryWithIdentifier:identifier fromPoint:from toPoint:to];
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(BOOL translate))translatesReferenceBoundary
{
    @weakify(self);
    return ^(BOOL translate) {
        @strongify(self);
        
        [self.collision setTranslatesReferenceBoundsIntoBoundary:translate];
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(id<UIDynamicItem> item))addItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item) {
        @strongify(self);
        
        [self.collision addItem:item];
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(id<UIDynamicItem> item))removeItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item) {
        @strongify(self);
        
        [self.collision removeItem:item];
        
        return self;
    };
}
@end
