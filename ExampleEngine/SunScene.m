//
//  SunScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/12/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "SunScene.h"
#import "EEEllipse.h"


@interface SunScene () {
    EEEllipse *ellipse;
}

@end

@implementation SunScene

- (id)init {
    self = [super init];
    if (self) {
        ellipse = [[EEEllipse alloc] init];
        ellipse.radiusX = 1;
        ellipse.radiusY = 1;
        
        [ellipse setTextureImage:[UIImage imageNamed:@"sun.jpg"]];
        float textureSunRadius = 0.5;
        float textureCenterOffset = 0.5;
        for (int i = 0; i < ellipse.numVertices; i++) {
            float theta = (M_TAU / ellipse.numVertices) * i;
            ellipse.textureCoordinates[i] = GLKVector2Make( (textureCenterOffset + textureSunRadius * cos(theta)),
                                                           (textureCenterOffset + textureSunRadius * sin(theta)) );
        }
    }
    return self;
}


- (void)render {
    [super render];
    [ellipse renderInScene:self];
}

@end
