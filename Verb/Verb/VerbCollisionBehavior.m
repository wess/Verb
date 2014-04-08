//
//  VerbCollisionBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbCollisionBehavior.h"

@interface VerbCollisionBehaviorDelegateHandler : NSObject<UICollisionBehaviorDelegate>
@property (copy, nonatomic) void(^beginContactForItem)(id<UIDynamicItem>item, id<NSCopying>identifier, CGPoint atPoint);
@property (copy, nonatomic) void(^beginContactForItems)(id<UIDynamicItem> forItem, id<UIDynamicItem> withItem, CGPoint atPoint);
@property (copy, nonatomic) void(^endContactForItem)(id<UIDynamicItem>item, id<NSCopying>identifier);
@property (copy, nonatomic) void(^endContactForItems)(id<UIDynamicItem> forItem, id<UIDynamicItem> withItem);
@end

@implementation VerbCollisionBehaviorDelegateHandler

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    if(self.beginContactForItem)
        self.beginContactForItem(item, identifier, p);
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    if(self.beginContactForItems)
        self.beginContactForItems(item1, item2, p);
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    if(self.endContactForItem)
        self.endContactForItem(item, identifier);
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2
{
    if(self.endContactForItems)
        self.endContactForItems(item1, item2);
}

@end

@interface VerbCollisionBehavior()
@property (strong, nonatomic) UICollisionBehavior                   *collision;
@property (strong, nonatomic) VerbCollisionBehaviorDelegateHandler  *delegateHandler;
@end

@implementation VerbCollisionBehavior
- (UIDynamicBehavior *)behavior
{
    return self.collision;
}

- (UICollisionBehavior *)collision
{
    if(_collision)
        return _collision;
    
    _collision = [[UICollisionBehavior alloc] initWithItems:self.items];
    
    return _collision;
}

- (VerbCollisionBehaviorDelegateHandler *)delegateHandler
{
    if(_delegateHandler)
        return _delegateHandler;
    
    _delegateHandler                    = [[VerbCollisionBehaviorDelegateHandler alloc] init];
    self.collision.collisionDelegate    = _delegateHandler;
    
    return _delegateHandler;
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

#pragma mark - Delegate base callbacks
- (void)setBeginContactForItem:(void (^)(id<UIDynamicItem>, id<NSCopying>, CGPoint))beginContactForItem
{
    self.delegateHandler.beginContactForItem = beginContactForItem;
}

- (void)setBeginContactForItems:(void (^)(id<UIDynamicItem>, id<UIDynamicItem>, CGPoint))beginContactForItems
{
    self.delegateHandler.beginContactForItems = beginContactForItems;
}

- (void)setEndContactForItem:(void (^)(id<UIDynamicItem>, id<NSCopying>))endContactForItem
{
    self.delegateHandler.endContactForItem = endContactForItem;
}

- (void)setEndContactForItems:(void (^)(id<UIDynamicItem>, id<UIDynamicItem>))endContactForItems
{
    self.delegateHandler.endContactForItems = endContactForItems;
}

@end
