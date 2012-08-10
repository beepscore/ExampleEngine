//
//  EEAppDelegate.h
//  ExampleEngine
//
//  Created by Steve Baker on 8/8/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "EEScene.h" 

@interface EEAppDelegate : UIResponder
    <UIApplicationDelegate, GLKViewDelegate, GLKViewControllerDelegate> {
        EEScene *scene;
    }

@property (strong, nonatomic) UIWindow *window;

@end
