//
//  VerbBehaviorProtocol.h
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VerbBehaviorProtocol <NSObject>
- (VerbBlock)action;
- (UIDynamicBehavior *)behavior;
- (UIView *)view;
@end
