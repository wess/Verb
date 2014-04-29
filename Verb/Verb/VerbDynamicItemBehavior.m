//
//  VerbDynamicItemBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/7/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbDynamicItemBehavior.h"
#import "VerbConstants.h"

@interface VerbDynamicItemBehavior()
@property (strong, nonatomic) UIDynamicItemBehavior *dynamic;
@end

@implementation VerbDynamicItemBehavior
- (instancetype)initWithItems:(NSArray *)items
{
    self = [super initWithItems:items];
    if(self)
    {
    }
    return self;
}

- (UIDynamicItemBehavior *)dynamic
{
    if(_dynamic)
        return _dynamic;
    
    _dynamic = [[UIDynamicItemBehavior alloc] initWithItems:self.items];
    
    return _dynamic;
}

- (UIDynamicBehavior *)behavior
{
    return self.dynamic;
}

- (VerbDynamicItemBehavior *(^)(BOOL rotate))allowRotation
{
    @weakify(self);
    return ^(BOOL rotate) {
        @strongify(self);
        
        self.dynamic.allowsRotation = rotate;
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(CGFloat resistance))resistance
{
    @weakify(self);
    return ^(CGFloat resistance) {
        @strongify(self);
        
        self.dynamic.resistance = resistance;
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(CGFloat resistance))angularResistance
{
    @weakify(self);
    return ^(CGFloat resistance) {
        @strongify(self);
        
        self.dynamic.angularResistance = resistance;
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(CGFloat density))density
{
    @weakify(self);
    return ^(CGFloat density) {
        @strongify(self);
        
        self.dynamic.density = density;
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(CGFloat elasticity))elasticity
{
    @weakify(self);
    return ^(CGFloat elasticity) {
        @strongify(self);
        
        self.dynamic.elasticity = elasticity;
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(CGFloat friction))friction
{
    @weakify(self);
    return ^(CGFloat friction) {
        @strongify(self);
        
        self.dynamic.friction = friction;
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(id<UIDynamicItem> item))addItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item) {
        @strongify(self);
        
        [self.dynamic addItem:item];
        
        return self;
    };
}

- (VerbDynamicItemBehavior *(^)(id<UIDynamicItem> item))removeItem
{
    @weakify(self);
    return ^(id<UIDynamicItem> item) {
        @strongify(self);
        
        [self.dynamic removeItem:item];
        
        return self;
    };
}

@end
