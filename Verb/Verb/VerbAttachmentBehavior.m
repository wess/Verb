//
//  VerbAttachmentBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/10/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbAttachmentBehavior.h"

@interface VerbAttachmentBehavior()
@property (readwrite, nonatomic) CGPoint                    itemAnchorPoint;
@property (strong, nonatomic) id<UIDynamicItem>             item;
@property (readwrite, nonatomic) UIOffset                   itemOffset;
@property (strong, nonatomic) id<UIDynamicItem>             attachedItem;
@property (readwrite, nonatomic) UIOffset                   attachedItemOffset;
@property (readwrite, nonatomic) UIAttachmentBehaviorType   attachType;
@property (readwrite, nonatomic) CGFloat                    attachDamping;
@property (readwrite, nonatomic) CGFloat                    attachFrequency;
@property (readwrite, nonatomic) CGFloat                    attachLength;
@end

@implementation VerbAttachmentBehavior
- (instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithItems:items];
    if (self)
    {
        self.item               = items.lastObject;
        self.itemAnchorPoint    = CGPointZero;
        self.itemOffset         = UIOffsetZero;
        self.attachedItem       = nil;
        self.attachedItemOffset = UIOffsetZero;
    }
    
    return self;
}

- (UIDynamicBehavior *)behavior
{
    UIAttachmentBehavior *attachment = nil;

    if(!UIOffsetEqualToOffset(self.itemOffset, UIOffsetZero) && self.attachedItem != nil && !UIOffsetEqualToOffset(self.attachedItemOffset, UIOffsetZero))
        attachment = [[UIAttachmentBehavior alloc] initWithItem:self.item offsetFromCenter:self.itemOffset attachedToItem:self.attachedItem offsetFromCenter:self.attachedItemOffset];
    else if(!UIOffsetEqualToOffset(self.itemOffset, UIOffsetZero) && !CGPointEqualToPoint(self.itemAnchorPoint, CGPointZero))
        attachment = [[UIAttachmentBehavior alloc] initWithItem:self.item offsetFromCenter:self.itemOffset attachedToAnchor:self.itemAnchorPoint];
    else if(self.attachedItem != nil)
        attachment = [[UIAttachmentBehavior alloc] initWithItem:self.item attachedToItem:self.attachedItem];
    else if(!CGPointEqualToPoint(self.itemAnchorPoint, CGPointZero))
        attachment = [[UIAttachmentBehavior alloc] initWithItem:self.item attachedToAnchor:self.itemAnchorPoint];
    
    return attachment;
}

- (VerbAttachmentBehavior *(^)(CGPoint point))attachToAnchor
{
    @weakify(self);
    return ^(CGPoint point){
        @strongify(self);
        
        self.itemAnchorPoint = point;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(id<UIDynamicItem> item))attachToItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item){
        @strongify(self);
        
        self.attachedItem = item;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(id<UIDynamicItem> item, UIOffset offset))attachToItemWithCenterOffset
{
    @weakify(self);
    return ^(id<UIDynamicItem> item, UIOffset offset){
        @strongify(self);
        
        self.attachedItem       = item;
        self.attachedItemOffset = offset;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(UIOffset offset))centerOffset
{
    @weakify(self);
    return ^(UIOffset offset){
        @strongify(self);
        
        self.itemOffset = offset;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(CGPoint point))anchorPoint
{
    @weakify(self);
    return ^(CGPoint point){
        @strongify(self);
        
        self.itemAnchorPoint = point;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(UIAttachmentBehaviorType type))type
{
    @weakify(self);
    return ^(UIAttachmentBehaviorType type){
        @strongify(self);
        
        
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(CGFloat damping))damping
{
    @weakify(self);
    return ^(CGFloat damping){
        @strongify(self);
        
        self.attachDamping = damping;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(CGFloat frequency))frequency
{
    @weakify(self);
    return ^(CGFloat frequency){
        @strongify(self);
        
        self.attachFrequency = frequency;
        
        return self;
    };
}

- (VerbAttachmentBehavior *(^)(CGFloat length))length
{
    @weakify(self);
    return ^(CGFloat length){
        @strongify(self);
        
        self.attachLength = length;
        
        return self;
    };
}

@end
