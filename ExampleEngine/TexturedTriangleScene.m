//
//  TexturedTriangleScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/12/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "TexturedTriangleScene.h"
#import "EETriangle.h"

@interface TexturedTriangleScene () {
    EETriangle *triangle;
}

@end


@implementation TexturedTriangleScene

- (id)init {
    self = [super init];
    if (self) {
        triangle = [[EETriangle alloc] init];
        
        // equilateral triangle
        // shape vertex positions relative to projection matrix bounds
        triangle.vertices[0] = GLKVector2Make(-1, -1);
        triangle.vertices[1] = GLKVector2Make(1, -1);
        triangle.vertices[2] = GLKVector2Make(0, -1 + (2*sin(M_TAU/6)) );
        
        [triangle setTextureImage:[UIImage imageNamed:@"sun.jpg"]];
        triangle.textureCoordinates[0] = GLKVector2Make( 0, 0 );
        triangle.textureCoordinates[1] = GLKVector2Make( 1, 0 );
        triangle.textureCoordinates[2] = GLKVector2Make( 0.5, 1 );
    }
    return self;
}


- (void)render {
    [super render];
    [triangle renderInScene:self];
}

@end
