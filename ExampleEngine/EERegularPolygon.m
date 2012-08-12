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

#pragma mark - initializers
// designated initializer
- (id)initWithNumSides:(int)aNumSides {
    // call super's designated initializer
    self = [super init];
    if (self) {
        _numSides = aNumSides;
    }
    return self;
}


// When a class has it's own designated initializer,
// override superclass' designated initializer (e.g. init) to call self's designated initializer.
// This way, if someone accidentally calls super's designated initializer,
// self's designated initializer will still be called. Ref Hillegass pg 57
- (id)init {
    return [self initWithNumSides:3];
}


#pragma mark -
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
