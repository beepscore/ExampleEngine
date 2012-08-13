//
//  EESprite.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/12/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EESprite.h"

@implementation EESprite

- (id)initWithImage:(UIImage *)anImage pointRatio:(float)aRatio {
    
    self = [super init];
    if (self) {
        self.width = (anImage.size.width/aRatio);
        self.height = (anImage.size.height/aRatio);
        
        [self setTextureImage:anImage];
        self.textureCoordinates[0] = GLKVector2Make(1, 0);
        self.textureCoordinates[1] = GLKVector2Make(1, 1);
        self.textureCoordinates[2] = GLKVector2Make(0, 1);
        self.textureCoordinates[3] = GLKVector2Make(0, 0);
    }
    return self;
}

@end
