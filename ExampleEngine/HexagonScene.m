//
//  HexagonScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "HexagonScene.h"
#import "EERegularPolygon.h"

@interface HexagonScene () {
    EERegularPolygon *hexagon;
}

@end

@implementation HexagonScene

- (id)init {
    self = [super init];
    if (self) {
        hexagon = [[EERegularPolygon alloc] initWithNumSides:6];
        hexagon.radius = 1;
    }
    return self;
}


- (void)render {
    [super render];
    [hexagon render];
}

@end
