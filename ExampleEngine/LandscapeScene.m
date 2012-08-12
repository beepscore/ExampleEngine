//
//  LandscapeScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/12/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "LandscapeScene.h"
#import "EERectangle.h"

@interface LandscapeScene () {
    EERectangle *rectangle;
}

@end

@implementation LandscapeScene

- (id)init {
    self = [super init];
    if (self) {
        rectangle = [[EERectangle alloc] init];
        rectangle.width = 6;
        rectangle.height = 4;
        [rectangle setTextureImage:[UIImage imageNamed:@"russian_rocket.png"]];
        rectangle.textureCoordinates[0] = GLKVector2Make(1, 0);
        rectangle.textureCoordinates[1] = GLKVector2Make(1, 1);
        rectangle.textureCoordinates[2] = GLKVector2Make(0, 1);
        rectangle.textureCoordinates[3] = GLKVector2Make(0, 0);
    }
    return self;
}


- (void)render {
    [super render];
    [rectangle renderInScene:self];
}

@end
