//
//  UIView+Verb.h
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VerbAnimator;
@interface UIView (Verb)
- (void)verb_makeAnimations:(void(^)(VerbAnimator *animator))block;
@end
