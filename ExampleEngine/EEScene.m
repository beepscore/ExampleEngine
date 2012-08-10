//
//  EEScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/9/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEScene.h"

@implementation EEScene


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
    
    // allocating effect each time through the loop is very inefficient
    // GLKBaseEffect uses OpenGL ES 2 shaders to mimic OpenGL ES 1.1
    GLKBaseEffect *effect = [[GLKBaseEffect alloc] init];
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
