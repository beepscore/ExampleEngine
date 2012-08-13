//
//  EESprite.h
//  ExampleEngine
//
//  Created by Steve Baker on 8/12/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EERectangle.h"

@interface EESprite : EERectangle

/**
 @brief designated initializer.
 */
- (id)initWithImage:(UIImage *)anImage pointRatio:(float)aRatio;

@end
