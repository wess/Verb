//
//  VerbBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbConstants.h"

@interface VerbBehavior : NSObject
@property (strong, readonly, nonatomic) UIDynamicBehavior   *behavior;
@property (strong, readonly, nonatomic) VerbBehavior        *(^action)(VerbBlock action);
@property (strong, readonly, nonatomic) UIView              *attachedView;

- (instancetype)init __attribute__((unavailable("Invoke the designated initializer `initWithReferenceView` instead.")));
- (instancetype)initWithAttachmentView:(UIView *)view;
@end
