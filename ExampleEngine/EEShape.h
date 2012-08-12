#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
@class EEScene;
#define M_TAU (2*M_PI)

/**
 EEShape.h
 ExampleEngine
 
 @author Steve Baker Beepscore LLC
 @date 11 Aug 2012
 Copyright (c) 2012 Beepscore LLC. All rights reserved.
 */

/**
 @brief EEShape acts as a base class or template, similar to a java abstract class.
 It should be subclassed.
 */

@interface EEShape : NSObject {
}

// subclasses should override numVertices to return positive int
@property (readonly) int numVertices;

/**
 @brief vertices points to GLKVector2 struct
 */
@property (readonly) GLKVector2 *vertices;

/**
 @brief NO - use vertex colors
        YES - use constant color for entire shape
        default is YES
 */
@property BOOL useConstantColor;

/**
 @brief color of the shape
 */
@property GLKVector4 color;

/**
 @brief vertex colors of the shape
 */
@property (readonly) GLKVector4 *vertexColors;

/**
 @brief texture coordinates
 */
@property (readonly) GLKVector2 *textureCoordinates;

- (void)setTextureImage:(UIImage *)image;

- (void)renderInScene:(EEScene *)scene;

@end
