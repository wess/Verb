//
//  VerbBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbBehavior.h"

@implementation VerbBehavior
@synthesize behavior        = _behavior;
@synthesize attachedView    = _attachedView;

- (instancetype)initWithAttachmentView:(UIView *)view
{
    self = [super init];
    if(self)
        _attachedView = view;

    return self;
}

- (UIDynamicBehavior *)behavior
{
    VerbMethodNotImplemented();
    
    return nil;
}

- (VerbBehavior *(^)(VerbBlock action))action
{
    @weakify(self);
    return  ^(VerbBlock action){
        @strongify(self);
        
        self.behavior.action = [action copy];
        
        return self;
    };
}

@end
