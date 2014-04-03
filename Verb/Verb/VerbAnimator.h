//
//  VerbAnimator.h
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

@import Foundation;
@import UIKit;

#import "VerbCollisionBehavior.h"
#import "VerbGravityBehavior.h"

@interface VerbAnimator : NSObject
@property (strong, readonly, nonatomic) VerbCollisionBehavior   *collision;
@property (strong, readonly, nonatomic) VerbGravityBehavior     *gravity;

- (instancetype)init __attribute__((unavailable("Invoke the designated initializer `initWithReferenceView` instead.")));
- (instancetype)initWithReferenceView:(UIView *)view animator:(UIDynamicAnimator *)animator;
- (void)install;
@end
