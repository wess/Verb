//
//  VerbCollisionBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbBehavior.h"

@interface VerbCollisionBehavior : VerbBehavior
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryPath)(UIBezierPath *path);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryRect)(CGRect rect);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^boundaryPoints)(CGPoint fromPoint, CGPoint toPoint);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^mode)(UICollisionBehaviorMode mode);
@property (strong, readonly, nonatomic) VerbCollisionBehavior *(^insets)(UIEdgeInsets insets);

+ (instancetype)collisionBehaviorWithView:(UIView *)view;
@end
