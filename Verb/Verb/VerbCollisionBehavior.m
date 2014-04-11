//
//  VerbCollisionBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbCollisionBehavior.h"
#import "VerbConstants.h"


@interface VerbCollisionBehaviorDelegateHandler : NSObject<UICollisionBehaviorDelegate>
@property (strong, nonatomic) VerbCollisionBehavior                 *behavior;
@property (copy, nonatomic) VerbCollisionBeginContactForItemBlock   beginContactForItem;
@property (copy, nonatomic) VerbCollisionBeginContactForItemsBlock  beginContactForItems;
@property (copy, nonatomic) VerbCollisionEndContactForItemBlock     endContactForItem;
@property (copy, nonatomic) VerbCollisionEndContactForItemsBlock    endContactForItems;
@end

@implementation VerbCollisionBehaviorDelegateHandler
#pragma mark - UICollisionBehaviorDelegate
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
    _delegateHandler.behavior           = self;
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

- (VerbCollisionBehavior *(^)(VerbCollisionBeginContactForItemBlock block))beginContactForItem
{
    @weakify(self);
    return ^(VerbCollisionBeginContactForItemBlock block) {
        @strongify(self);
        
        self.delegateHandler.beginContactForItem = block;
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(VerbCollisionBeginContactForItemsBlock block))beginContactForItems
{
    @weakify(self);
    return ^(VerbCollisionBeginContactForItemsBlock block) {
        @strongify(self);
        
        self.delegateHandler.beginContactForItems = block;
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(VerbCollisionEndContactForItemBlock block))endContactForItem
{
    @weakify(self);
    return ^(VerbCollisionEndContactForItemBlock block) {
        @strongify(self);
        
        self.delegateHandler.endContactForItem = block;
        
        return self;
    };
}

- (VerbCollisionBehavior *(^)(VerbCollisionEndContactForItemsBlock block))endContactForItems
{
    @weakify(self);
    return ^(VerbCollisionEndContactForItemsBlock block) {
        @strongify(self);
        
        self.delegateHandler.endContactForItems = block;
        
        return self;
    };
}

@end







