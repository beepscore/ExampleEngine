//
//  EEAppDelegate.h
//  ExampleEngine
//
//  Created by Steve Baker on 8/8/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
//@class TriangleScene;
//@class RectangleScene;
//@class HexagonScene;
//@class EllipseScene;
//@class LandscapeScene;
@class SunScene;

@interface EEAppDelegate : UIResponder
    <UIApplicationDelegate, GLKViewDelegate, GLKViewControllerDelegate> {
//        TriangleScene *scene;
//        RectangleScene *scene;
//        EllipseScene *scene;
//        HexagonScene *scene;
        // LandscapeScene *scene;
        SunScene *scene;
    }

@property (strong, nonatomic) UIWindow *window;

@end
