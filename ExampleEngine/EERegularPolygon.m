//
//  EERegularPolygon.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EERegularPolygon.h"

@implementation EERegularPolygon

@synthesize radius;

- (id)initWithNumSides:(int)aNumSides {
    self = [super init];
    if (self) {
        _numSides = aNumSides;
    }
    return self;
}

- (int)numVertices {
    return self.numSides;
}


- (float)radius {
    return radius;
}


- (void)setRadius:(float)aRadius {
    radius = aRadius;
    [self updateVertices];
}

- (void)updateVertices {
    for (int i = 0; i < self.numSides; i++) {
        float theta = ((M_TAU / self.numSides) * i );
        self.vertices[i] = GLKVector2Make(self.radius*cos(theta), self.radius*sin(theta));
    }
}

@end
