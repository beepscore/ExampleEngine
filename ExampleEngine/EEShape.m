//
//  EEShape.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEShape.h"

@interface EEShape () {
    NSMutableData *vertexData;
}

@end

@implementation EEShape

- (int)numVertices {
    return 0;
}


- (GLKVector2 *)vertices {
    if (nil == vertexData) {
        // lazy instantiate
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector2)*self.numVertices];
    }
    return [vertexData mutableBytes];
}

@end
