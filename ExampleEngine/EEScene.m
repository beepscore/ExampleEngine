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
        self.left = -3;
        self.right = 3;
        self.bottom = -2;
        self.top = 2;
        effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(self.left, self.right, self.bottom, self.top, 1, -1);
    }
    return self;
}


- (void)update {
    // NSLog(@"in EEScene's update");
}


- (void)render {
    // NSLog(@"in EEScene's render");
    // r,g,b,alpha
    glClearColor(self.clearColor.r, self.clearColor.g, self.clearColor.b, self.clearColor.a);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [effect prepareToDraw];
}

@end
