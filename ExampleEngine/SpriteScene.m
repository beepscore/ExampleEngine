//
//  SpriteScene.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/12/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "SpriteScene.h"
#import "EESprite.h"

@interface SpriteScene () {
    EESprite *sprite;
}

@end

@implementation SpriteScene

- (id)init {
    self = [super init];
    if (self) {
        sprite = [[EESprite alloc] initWithImage:[UIImage imageNamed:@"my_sprite.png"]
                                      pointRatio:100];
        sprite.scale = GLKVector2Make(0.5, 1.5);
        sprite.rotation = 0.25 * M_TAU;
        sprite.position = GLKVector2Make(2, -1);
    }
    return self;
}


- (void)render {
    [super render];
    [sprite renderInScene:self];
}

@end
