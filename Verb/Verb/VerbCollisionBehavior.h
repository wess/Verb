//
//  VerbCollisionBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbBehavior.h"

@interface VerbCollisionBehavior : VerbBehavior
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^mode)(UICollisionBehaviorMode mode);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryPath)(NSString *identifier, UIBezierPath *path);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryRect)(NSString *identifier, CGRect rect);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryPoints)(NSString *identifier, CGPoint from, CGPoint to);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^translatesReferenceBoundary)(BOOL translate);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^addItem)(id<UIDynamicItem> item);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^removeItem)(id<UIDynamicItem> item);
@end
