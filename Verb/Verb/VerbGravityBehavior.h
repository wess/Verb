//
//  VerbGravityBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbBehavior.h"

@interface VerbGravityBehavior : VerbBehavior

@property (strong, readonly, nonatomic) VerbGravityBehavior *(^direction)(VerbDirection direction);
@property (strong, readonly, nonatomic) VerbGravityBehavior *(^angle)(CGFloat angle);
@property (strong, readonly, nonatomic) VerbGravityBehavior *(^magnitude)(CGFloat magnitude);

+ (instancetype)gravityBehaviorWithView:(UIView *)view;
@end
