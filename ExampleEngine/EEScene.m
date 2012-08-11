//
//  EEScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/9/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEScene.h"

@interface EEScene () {
    GLKBaseEffect *effect;
}

@end


@implementation EEScene

- (id)init {
    self = [super init];
    if (self) {
        // GLKBaseEffect uses OpenGL ES 2 shaders to mimic OpenGL ES 1.1
        effect = [[GLKBaseEffect alloc] init];
    }
    return self;
}


-(void)update {
    // NSLog(@"in EEScene's update");
}


-(void)render {
    // NSLog(@"in EEScene's render");
    // r,g,b,alpha
    glClearColor(self.clearColor.r, self.clearColor.g, self.clearColor.b, self.clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    // triangle about origin
    float vertices[] = {-1, -1, 1, -1, 0,  1};
    
    [effect prepareToDraw];
    
    // tell shader to use vertex position data
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    // second parameter vertex position is 2 dimensional
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, vertices);
    // draw the triangle
    glDrawArrays(GL_TRIANGLES, 0, 3);
    // clean up
    glDisableVertexAttribArray(GLKVertexAttribPosition);
}

@end
