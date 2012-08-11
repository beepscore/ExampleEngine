//
//  EEScene.h
//  ExampleEngine
//
//  Created by Steve Baker on 8/9/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface EEScene : NSObject

@property float left, right, bottom, top;
@property GLKVector4 clearColor;

- (void)update;

- (void)render;

@end
