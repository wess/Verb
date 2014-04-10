//
//  UIView+Verb.m
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "UIView+Verb.h"
#import <objc/runtime.h>
#import "VerbAnimator.h"
#import "VerbConstants.h"

@interface UIView (VerbPrivate)
@property (strong, nonatomic) VerbAnimator *animator;
@end

@implementation UIView (Verb)
static char *const VERB_ANIMATOR_KEY;

- (void)verb_makeAnimations:(void(^)(VerbAnimator *animator))block
{
    block([self animator]);
    [[self animator] install];
}

#pragma mark - Getter
- (VerbAnimator *)animator
{
    VerbAnimator *instance = (VerbAnimator *)objc_getAssociatedObject(self, VERB_ANIMATOR_KEY);
    if(instance)
        return instance;
    
    instance = [[VerbAnimator alloc] initWithView:self];
    objc_setAssociatedObject(self, VERB_ANIMATOR_KEY, instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return instance;
}

@end
