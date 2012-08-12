//
//  RectangleScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "RectangleScene.h"
#import "EERectangle.h"

@interface RectangleScene () {
    EERectangle *rectangle;
}

@end

@implementation RectangleScene

- (id)init {
    self = [super init];
    if (self) {
        rectangle = [[EERectangle alloc] init];
        rectangle.width = 2;
        rectangle.height = 1;
    }
    return self;
}


- (void)render {
    [super render];
    [rectangle render];
}

@end
