//
//  VerbCollisionBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbBehavior.h"

@class VerbCollisionBehavior;

typedef VerbCollisionBehavior   *(^VerbCollisionBeginContactForItemBlock)(id<UIDynamicItem>item, id<NSCopying>identifier, CGPoint atPoint);
typedef VerbCollisionBehavior   *(^VerbCollisionBeginContactForItemsBlock)(id<UIDynamicItem> forItem, id<UIDynamicItem> withItem, CGPoint atPoint);
typedef VerbCollisionBehavior   *(^VerbCollisionEndContactForItemBlock)(id<UIDynamicItem>item, id<NSCopying>identifier);
typedef VerbCollisionBehavior   *(^VerbCollisionEndContactForItemsBlock)(id<UIDynamicItem> forItem, id<UIDynamicItem> withItem);

@interface VerbCollisionBehavior : VerbBehavior
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^mode)(UICollisionBehaviorMode mode);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryPath)(NSString *identifier, UIBezierPath *path);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryRect)(NSString *identifier, CGRect rect);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryPoints)(NSString *identifier, CGPoint from, CGPoint to);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^translatesReferenceBoundary)(BOOL translate);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^addItem)(id<UIDynamicItem> item);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^removeItem)(id<UIDynamicItem> item);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^beginContactForItem)(VerbCollisionBeginContactForItemBlock block);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^beginContactForItems)(VerbCollisionBeginContactForItemsBlock block);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^endContactForItem)(VerbCollisionEndContactForItemBlock block);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^endContactForItems)(VerbCollisionEndContactForItemsBlock block);
@end
