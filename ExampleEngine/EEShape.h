#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#define M_TAU (2*M_PI)

/**
 EEShape.h
 ExampleEngine
 
 @author Steve Baker Beepscore LLC
 @date 11 Aug 2012
 Copyright (c) 2012 Beepscore LLC. All rights reserved.
 */

/**
 @brief EEShape acts as an abstract class and should be subclassed
 */

@interface EEShape : NSObject {
}

// subclasses should override numVertices to return positive int
@property (readonly) int numVertices;

/**
 @brief vertices points to GLKVector2 struct
 */
@property (readonly) GLKVector2 *vertices;

- (void)render;

@end
