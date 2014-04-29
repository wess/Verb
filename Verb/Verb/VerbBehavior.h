//
//  VerbBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface VerbBehavior : NSObject
@property (copy, nonatomic) VerbBlock                       action;
@property (strong, readonly, nonatomic) UIDynamicBehavior   *behavior;
@property (strong, nonatomic) UIView                        *view;

- (instancetype)initWithItems:(NSArray *)items;

@end

@interface VerbBehavior()
@property (strong, nonatomic) NSArray *items;
@end