//
//  UIView+Verb.h
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerbAnimator.h"

@interface UIView (Verb)
- (void)verb_makeAnimation:(void(^)(VerbAnimator *animator))block;
@end
