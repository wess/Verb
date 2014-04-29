//
//  VerbAnimator.h
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

@import Foundation;
@import UIKit;

@class VerbGravityBehavior, VerbCollisionBehavior, VerbDynamicItemBehavior, VerbAttachmentBehavior;

@interface VerbAnimator : UIDynamicBehavior
@property (strong, readonly, nonatomic) void(^referenceView)(UIView *view);
@property (strong, readonly, nonatomic) VerbGravityBehavior     *gravity;
@property (strong, readonly, nonatomic) VerbCollisionBehavior   *collision;
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *dynamicItem;
@property (strong, readonly, nonatomic) VerbAttachmentBehavior  *attachment;


- (instancetype)initWithView:(UIView *)view;
- (void)install;
@end
