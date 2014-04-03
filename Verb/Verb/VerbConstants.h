//
//  VerbConstants.h
//  Verb
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

@import Foundation;
@import UIKit;

#ifndef _VerbConstants_h
#define _VerbConstants_h

#define VerbMethodNotImplemented() @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] userInfo:nil]


#ifndef weakify
#define weakify(context) try {} @finally {} \
__weak typeof(context) nf_weak_ ## context = context
#endif

#ifndef strongify
#define strongify(o) try {} @finally {} \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
typeof(nf_weak_ ## o) o = nf_weak_ ## o \
_Pragma("clang diagnostic pop")
#endif

typedef void(^VerbBlock)(void);

typedef NS_ENUM(NSInteger, VerbDirection)
{
    VerbDirectionUp = 1,
    VerbDirectionRight,
    VerbDirectionDown,
    VerbDirectionLeft
};



static CGFloat VerbDegreesToRadians(CGFloat degrees) __attribute__((unused));
CGFloat VerbDegreesToRadians(CGFloat degrees)
{
    return (degrees * M_PI / 180.0);
}


static CGVector VerbVectorForDirection(VerbDirection direction) __attribute__((unused));
CGVector VerbVectorForDirection(VerbDirection direction)
{
    switch (direction)
    {
        case VerbDirectionUp:
            return CGVectorMake(0, -1);
        case VerbDirectionRight:
            return CGVectorMake(-1, 0);
        case VerbDirectionDown:
            return CGVectorMake(0, 1);
        case VerbDirectionLeft:
            return CGVectorMake(1, 0);
    }
    
    return CGVectorMake(0, 0);
}

#endif
