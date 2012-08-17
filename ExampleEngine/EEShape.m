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
    NSMutableData *vertexColorData;
    NSMutableData *textureCoordinateData;
    GLKBaseEffect *effect;
    GLKTextureInfo *texture;
}

@end


@implementation EEShape

- (id)init {
    self = [super init];
    if (self) {
        // GLKBaseEffect uses OpenGL ES 2 shaders to mimic OpenGL ES 1.1
        effect = [[GLKBaseEffect alloc] init];
        self.useConstantColor = YES;
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


- (GLKVector4 *)vertexColors {
    if (nil == vertexColorData) {
        // lazy instantiate vertexColorData with sufficient length in bytes
        vertexColorData = [NSMutableData dataWithLength:(sizeof(GLKVector4) * self.numVertices)];
    }
    return [vertexColorData mutableBytes];
}


- (GLKVector2 *)textureCoordinates {
    if (nil == textureCoordinateData) {
        // lazy instantiate textureCoordinateData with sufficient length in bytes
        textureCoordinateData = [NSMutableData dataWithLength:(sizeof(GLKVector2) * self.numVertices)];
    }
    return [textureCoordinateData mutableBytes];
}


- (void)setTextureImage:(UIImage *)image {
    NSError *error;
    texture = [GLKTextureLoader
               textureWithCGImage:image.CGImage
               // options: use NSDictionay literal syntax
               //options:@{GLKTextureLoaderOriginBottomLeft : @YES}
               options:@{GLKTextureLoaderOriginBottomLeft : [NSNumber numberWithBool:YES]}
               error:&error];
    if (error) {
        NSLog(@"Error loading texture from image: %@", error);
    }
}


- (void)renderInScene:(EEScene *)scene {
    
    // turn on alpha transparency
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    // TODO: Move effect creation out of frame loop.
    effect.transform.projectionMatrix = scene.projectionMatrix;
    
    // In matrix multiplication, second matrix is applied first.
    // rotate, then translate.
    effect.transform.modelviewMatrix =
        GLKMatrix4Multiply(GLKMatrix4MakeTranslation(self.position.x, self.position.y, 0), GLKMatrix4MakeRotation(self.rotation, 0, 0, 1));
    
    if (texture) {
        effect.texture2d0.envMode = GLKTextureEnvModeReplace;
        effect.texture2d0.target = GLKTextureTarget2D;
        effect.texture2d0.name = texture.name;
        glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
        glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.textureCoordinates);
    } else {
        if (self.useConstantColor) {
            effect.useConstantColor = YES;
            effect.constantColor = self.color;
        } else {
            effect.useConstantColor = NO;
            // tell shader to use vertex color data
            glEnableVertexAttribArray(GLKVertexAttribColor);
            // second parameter vertex color is 4 dimensional
            glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, self.vertexColors);
        }
    }
    
    [effect prepareToDraw];
    
    // tell shader to use vertex position data
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    // second parameter vertex position is 2 dimensional
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.vertices);
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, self.numVertices);
    
    // clean up
    glDisable(GL_BLEND);
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    if (!self.useConstantColor) {
        glDisableVertexAttribArray(GLKVertexAttribColor);
    }
    if (!texture) {
        glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
    }
}

@end
