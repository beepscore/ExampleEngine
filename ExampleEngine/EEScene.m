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
    glClearColor(0.5, 0.5, 0.5, 0.5);
    glClear(GL_COLOR_BUFFER_BIT);
}

@end
