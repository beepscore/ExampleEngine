//
//  EEAppDelegate.h
//  ExampleEngine
//
//  Created by Steve Baker on 8/8/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "TriangleScene.h"

@interface EEAppDelegate : UIResponder
    <UIApplicationDelegate, GLKViewDelegate, GLKViewControllerDelegate> {
        TriangleScene *scene;
    }

@property (strong, nonatomic) UIWindow *window;

@end
