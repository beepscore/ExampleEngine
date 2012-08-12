//
//  EEEllipse.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEEllipse.h"

#define EE_ELLIPSE_RESOLUTION 64
#define M_TAU (2*M_PI)

@implementation EEEllipse

// need to explicitly synthesize when overriding accessors
@synthesize radiusX, radiusY;


- (int)numVertices {
    return EE_ELLIPSE_RESOLUTION;
}


- (float)radiusX {
    return radiusX;
}


- (void)setRadiusX:(float)aRadiusX {
    radiusX = aRadiusX;
    [self updateVertices];
}


- (float)radiusY {
    return radiusY;
}


- (void)setRadiusY:(float)aRadiusY {
    radiusY = aRadiusY;
    [self updateVertices];
}


- (void)updateVertices {
    for (int i = 0; i < EE_ELLIPSE_RESOLUTION; i++) {
        float theta = ((float)i) / EE_ELLIPSE_RESOLUTION * M_TAU;
        self.vertices[i] = GLKVector2Make(cos(theta)*self.radiusX, sin(theta)*self.radiusY);
    }
}

@end
