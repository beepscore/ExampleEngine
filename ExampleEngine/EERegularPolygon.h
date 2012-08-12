//
//  EERegularPolygon.h
//  ExampleEngine
//
//  Created by Steve Baker on 8/11/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEShape.h"

@interface EERegularPolygon : EEShape

@property(readonly) int numSides;
@property float radius;

/**
 @brief designated initializer. init with aNumSides, corresponding property is numSides
 */
- (id)initWithNumSides:(int)aNumSides;

@end
