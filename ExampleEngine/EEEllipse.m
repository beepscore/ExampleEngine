//
//  EEEllipse.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEEllipse.h"

#define EE_ELLIPSE_RESOLUTION 64

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
        float theta = ( (M_TAU / EE_ELLIPSE_RESOLUTION) * i);
        self.vertices[i] = GLKVector2Make(self.radiusX*cos(theta), self.radiusY*sin(theta));
    }
}

@end
