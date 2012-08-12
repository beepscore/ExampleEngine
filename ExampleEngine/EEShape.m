//
//  EEShape.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEShape.h"
#import "EEScene.h"

@interface EEShape () {
    NSMutableData *vertexData;
    GLKBaseEffect *effect;
}

@end

@implementation EEShape

- (id)init {
    self = [super init];
    if (self) {
        // GLKBaseEffect uses OpenGL ES 2 shaders to mimic OpenGL ES 1.1
        effect = [[GLKBaseEffect alloc] init];
    }
    return self;
}


- (int)numVertices {
    return 0;
}


- (GLKVector2 *)vertices {
    if (nil == vertexData) {
        // lazy instantiate vertexData with sufficient length in bytes
        vertexData = [NSMutableData dataWithLength:(sizeof(GLKVector2) * self.numVertices)];
    }
    return [vertexData mutableBytes];
}

- (void)renderInScene:(EEScene *)scene {
    
    effect.transform.projectionMatrix = scene.projectionMatrix;
    [effect prepareToDraw];
    
    // tell shader to use vertex position data
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    // second parameter vertex position is 2 dimensional
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
    // clean up
    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

@end
