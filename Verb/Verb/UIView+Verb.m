//
//  UIView+Verb.m
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "UIView+Verb.h"
#import <objc/runtime.h>

@interface UIView()
@property (strong, readonly, nonatomic) UIDynamicAnimator *verb_animator;
@end

@implementation UIView (Verb)
static const char *VerbAnimatorProperty = "VerbAnimatorProperty";

- (void)setVerb_animator:(UIDynamicAnimator *)animator
{
    objc_setAssociatedObject(self, VerbAnimatorProperty, animator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIDynamicAnimator *)verb_animator
{
    return (UIDynamicAnimator *)objc_getAssociatedObject(self, VerbAnimatorProperty);
}

- (void)verb_makeAnimation:(void(^)(VerbAnimator *animator))block
{
    self.verb_animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.superview];

    VerbAnimator *animator = [[VerbAnimator alloc] initWithReferenceView:self animator:self.verb_animator];
    block(animator);
    [animator install];
}

@end
