//
//  VerbBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbBehavior.h"

@interface VerbBehavior()
@end

@implementation VerbBehavior
- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if(self)
    {
        self.items = items;
    }
    return self;
}

- (void)setAction:(VerbBlock)action
{
    self.behavior.action = action;
}

- (UIDynamicBehavior *)behavior
{
    VerbMethodNotImplemented();
    return nil;
}

@end
