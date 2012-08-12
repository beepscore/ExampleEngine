//
//  EllipseScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EllipseScene.h"
#import "EEEllipse.h"

@interface EllipseScene () {
    EEEllipse *ellipse;
}

@end

@implementation EllipseScene

- (id)init {
    self = [super init];
    if (self) {
        ellipse = [[EEEllipse alloc] init];
        ellipse.radiusX = 2;
        ellipse.radiusY = 1;
    }
    return self;
}


- (void)render {
    [super render];
    [ellipse render];
}

@end
