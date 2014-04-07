//
//  VerbDynamicItemBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbBehavior.h"

@interface VerbDynamicItemBehavior : VerbBehavior
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^allowRotation)(BOOL rotate);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^resistance)(CGFloat resistance);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^angularResistance)(CGFloat resistance);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^density)(CGFloat density);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^elasticity)(CGFloat elasticity);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^friction)(CGFloat friction);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^addItem)(id<UIDynamicItem> item);
@property (strong, readonly, nonatomic) VerbDynamicItemBehavior *(^removeItem)(id<UIDynamicItem> item);
@end
