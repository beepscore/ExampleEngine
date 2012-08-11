//
//  TriangleScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "TriangleScene.h"
#import "EETriangle.h"

@interface TriangleScene () {
    EETriangle *triangle;
}

@end


@implementation TriangleScene

- (id)init {
    self = [super init];
    if (self) {
        triangle = [[EETriangle alloc] init];
        triangle.vertices[0] = GLKVector2Make(-1, -1);
        triangle.vertices[1] = GLKVector2Make(1, -1);
        triangle.vertices[2] = GLKVector2Make(0, 1);
    }
    return self;
}


- (void)render {
    [super render];
    [triangle render];
}

@end
