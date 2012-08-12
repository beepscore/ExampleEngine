//
//  EEAppDelegate.m
//  ExampleEngine
//
//  Created by Steve Baker on 8/8/12.
//  Copyright (c) 2012 Steve Baker. All rights reserved.
//

#import "EEAppDelegate.h"
#import "EESceneController.h"

@implementation EEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:context];
    
    GLKView *view = [[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds] context:context];
    view.delegate = self;
    
    EESceneController *controller = [[EESceneController alloc] init];
    controller.delegate = self;
    controller.view = view;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    
    //scene = [[TriangleScene alloc] init];
    //scene = [[RectangleScene alloc] init];
    scene = [[EllipseScene alloc] init];
    scene.clearColor = GLKVector4Make(0.1, 0.9, 0.9, 0.0);
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - GLKViewControllerDelegate
- (void)glkViewControllerUpdate:(GLKViewController *)controller {
    // method for changing state (e.g. animations, physics simulations, game logic)
    // NSLog(@"in glkViewControllerUpdate");
    [scene update];
}


#pragma mark - GLKViewDelegate
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    // NSLog(@"in glkView:drawInRect:");
    [scene render];
}

@end
