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
@property (strong, readonly, nonatomic) UIDynamicBehavior       *behavior;
@property (strong, readonly, nonatomic) UIDynamicItemBehavior   *childBehavior;
@property (strong, readonly, nonatomic) UIView                  *attachedView;
@property (strong, readonly, nonatomic) VerbBehavior            *(^action)(VerbBlock action);
@property (strong, readonly, nonatomic) VerbBehavior            *(^allowsRotation)(BOOL rotation);
@property (strong, readonly, nonatomic) VerbBehavior            *(^angularResistance)(CGFloat resistance);
@property (strong, readonly, nonatomic) VerbBehavior            *(^density)(CGFloat density);
@property (strong, readonly, nonatomic) VerbBehavior            *(^elasticity)(CGFloat elasticity);
@property (strong, readonly, nonatomic) VerbBehavior            *(^friction)(CGFloat friction);
@property (strong, readonly, nonatomic) VerbBehavior            *(^resistance)(CGFloat resistance);
@property (strong, readonly, nonatomic) VerbBehavior            *(^linearVelocity)(CGPoint velocity);
@property (strong, readonly, nonatomic) VerbBehavior            *(^angularVelocity)(CGFloat velocity);

- (instancetype)init __attribute__((unavailable("Invoke the designated initializer `initWithReferenceView` instead.")));
- (instancetype)initWithAttachmentView:(UIView *)view;
@end
