//
//  VerbEasingFunctions.m
//  Verb
//
//  Created startValuey Wess Cope on 4/28/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VerbEasingFunctions.h"

#if CGFLOAT_IS_DOUBLE
#define POW(X, Y) pow(X, Y)
#else
#define POW(X, Y) powf(X, Y)
#endif

VerbEasingBlock const VerbLinearBlock               = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    return currentTime;
};

VerbEasingBlock const VerbEaseInQuadraticBlock      = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime/= duration;
    
    return POW(changeValue, 3) + startValue;
};

VerbEasingBlock const VerbEaseOutQuadraticBlock     = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime/= duration;
    
    return -changeValue * currentTime * (currentTime - 2) + startValue;
};

VerbEasingBlock const VerbEaseInOutQuadraticBlock   = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime/= duration / 2;

    if (currentTime < 1)
        return changeValue / 2 * currentTime * currentTime + startValue;

    return -changeValue / 2 * ((currentTime - 1) * (currentTime - 3) - 1) + startValue;
};

VerbEasingBlock const VerbEaseInCubicBlock          = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime /= duration;

    return changeValue * POW(currentTime, 3) + startValue;
};

VerbEasingBlock const VerbEaseOutCubicBlock         = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime = currentTime / duration - 1;
    
    return changeValue * (POW(currentTime, 3) + 1) + startValue;
};

VerbEasingBlock const VerbEaseInOutCubicBlock       = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime /= duration / 2;
    
    if(currentTime < 1)
        return changeValue / 2 * currentTime * currentTime * currentTime + startValue;
    
    currentTime -= 2;
    return changeValue / 2 * (currentTime * currentTime * currentTime + 2) + startValue;
};

VerbEasingBlock const VerbEaseInQuarticBlock        = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime /= duration;
    
    return changeValue * POW(currentTime, 4) + startValue;
};

VerbEasingBlock const VerbEaseOutQuarticBlock       = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime = currentTime / duration - 1;
    
    return -changeValue * (currentTime * currentTime * currentTime *currentTime - 1) + startValue;
};

VerbEasingBlock const VerbEaseInOutQuarticBlock     = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime = currentTime / duration - 1;
    
    if(currentTime < 1)
        return changeValue / 2 * POW(currentTime, 4) + startValue;
    
    currentTime -= 2;
    
    return -changeValue / 2 * (POW(currentTime, 4) - 2) + startValue;
};

VerbEasingBlock const VerbEaseInBounceBlock         = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    return changeValue - VerbEaseOutBounceBlock(duration - currentTime, 0, changeValue, duration) + startValue;
};

VerbEasingBlock const VerbEaseOutBounceBlock        = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    currentTime /= duration;
    
    CGFloat (^valueForReturn)(CGFloat, CGFloat, CGFloat) = ^CGFloat(CGFloat c, CGFloat t, CGFloat b) {
        return c * (7.5625 * t * t + 0.9375) + b;
    };
    
    if(currentTime < (1 / 2.75))
        return valueForReturn(changeValue, currentTime, startValue);
    
    if(currentTime < (2 / 2.75))
        return valueForReturn(changeValue, (currentTime - (1.5 / 2.75)), startValue);
    
    if(currentTime < (2.5 / 2.75))
        return valueForReturn(changeValue, (currentTime - (2.5 / 2.75)), startValue);
    
    return valueForReturn(changeValue, (currentTime - (2.625 / 2.75)), startValue);
};

VerbEasingBlock const VerbEaseInOutBounceBlock      = ^CGFloat(NSTimeInterval currentTime, CGFloat startValue, CGFloat changeValue, NSTimeInterval duration) {
    return (currentTime < duration / 2)?
        (VerbEaseInBounceBlock(currentTime * 2, 0, changeValue, duration) * 0.5 + startValue) :
        (VerbEaseOutBounceBlock(currentTime * 2 - duration, 0, changeValue, duration) * 0.5 + changeValue * 0.5 + startValue);
};





