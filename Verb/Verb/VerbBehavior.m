//
//  VerbBehavior.m
//  Verb
//
//  Created by Wess Cope on 4/3/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbBehavior.h"

@interface VerbBehavior()
@end

@implementation VerbBehavior
@synthesize behavior        = _behavior;
@synthesize attachedView    = _attachedView;
@synthesize childBehavior   = _childBehavior;

- (instancetype)initWithAttachmentView:(UIView *)view
{
    self = [super init];
    if(self)
        _attachedView = view;

    return self;
}

#pragma mark - Getters
- (UIDynamicBehavior *)behavior
{
    VerbMethodNotImplemented();
    
    return nil;
}

-(UIDynamicItemBehavior *)childBehavior
{
    if(_childBehavior)
        return _childBehavior;
    
    _childBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.attachedView]];

    return _childBehavior;
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

- (VerbBehavior *(^)(BOOL rotation))allowsRotation
{
    @weakify(self);
    return ^(BOOL rotation) {
        @strongify(self);
        
        self.childBehavior.allowsRotation = rotation;
        
        return self;
    };
}

- (VerbBehavior *(^)(CGFloat resistance))angularResistance
{
    @weakify(self);
    return ^(CGFloat resistance) {
        @strongify(self);
        
        self.childBehavior.angularResistance = resistance;
        
        return self;
    };
}

- (VerbBehavior *(^)(CGFloat density))density
{
    @weakify(self);
    return ^(CGFloat density) {
        @strongify(self);
        
        self.childBehavior.density = density;
        
        return self;
    };
}
   
- (VerbBehavior *(^)(CGFloat elasticity))elasticity
{
    @weakify(self);
    return ^(CGFloat elasticity) {
        @strongify(self);
        
        self.childBehavior.elasticity = elasticity;
        
        return self;
    };
}
   
- (VerbBehavior *(^)(CGFloat friction))friction
{
    @weakify(self);
    return ^(CGFloat friction) {
        @strongify(self);
        
        self.childBehavior.friction = friction;
        
        return self;
    };
}
   
- (VerbBehavior *(^)(CGFloat resistance))resistance
{
    @weakify(self);
    return ^(CGFloat resistance) {
        @strongify(self);
        
        self.childBehavior.resistance = resistance;
        
        return self;
    };
}

- (VerbBehavior *(^)(CGFloat velocity))angularVelocity;
{
    @weakify(self);
    return ^(CGFloat velocity) {
        @strongify(self);
        
        [self.childBehavior addAngularVelocity:velocity forItem:self.attachedView];
        
        return self;
    };
}

- (VerbBehavior *(^)(CGPoint velocity))linearVelocity;
{
    @weakify(self);
    return ^(CGPoint velocity) {
        @strongify(self);
        
        [self.childBehavior addLinearVelocity:velocity forItem:self.attachedView];
        
        return self;
    };
}

@end
