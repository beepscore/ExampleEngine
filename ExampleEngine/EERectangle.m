//
//  EERectangle.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EERectangle.h"

@interface EERectangle () {
}

@end


@implementation EERectangle

// need to explicitly synthesize when overriding accessors
@synthesize height, width;

- (int)numVertices {
    return 4;
}


- (float)height {
    return height;
}


- (void)setHeight:(float)aHeight {
    height = aHeight;
    [self updateVertices];
}


- (float)width {
    return width;
}


- (void)setWidth:(float)aWidth {
    width = aWidth;
    [self updateVertices];
}


- (void)updateVertices {
    self.vertices[0] = GLKVector2Make(  self.width/2.0, -self.height/2.0);
    self.vertices[1] = GLKVector2Make(  self.width/2.0,  self.height/2.0);
    self.vertices[2] = GLKVector2Make( -self.width/2.0,  self.height/2.0);
    self.vertices[3] = GLKVector2Make( -self.width/2.0, -self.height/2.0);
}

@end
