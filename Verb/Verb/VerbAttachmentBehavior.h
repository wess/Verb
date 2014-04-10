//
//  VerbAttachmentBehavior.h
//  Verb
//
//  Created by Wess Cope on 4/10/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerbBehavior.h"

@interface VerbAttachmentBehavior : VerbBehavior
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^attachToAnchor)(CGPoint point);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^attachToItem)(id<UIDynamicItem> item);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^attachToItemWithCenterOffset)(id<UIDynamicItem> item, UIOffset offset);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^centerOffset)(UIOffset offset);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^anchorPoint)(CGPoint point);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^type)(UIAttachmentBehaviorType type);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^damping)(CGFloat damping);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^frequency)(CGFloat frequency);
@property (strong, readonly, nonatomic) VerbAttachmentBehavior *(^length)(CGFloat length);
@end
