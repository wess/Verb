//
//  VRBAppDelegate.m
//  VerbExample
//
//  Created by Wess Cope on 4/2/14.
//  Copyright (c) 2014 Wess Cope. All rights reserved.
//

#import "VRBAppDelegate.h"
#import <Verb/Verb.h>

@implementation VRBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController *controller    = [[UIViewController alloc] initWithNibName:nil bundle:nil];
    controller.view.backgroundColor = [UIColor blueColor];
    
    self.window                     = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController  = controller;
    self.window.backgroundColor     = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 100.0, 100.0)];
    view.backgroundColor = [UIColor redColor];
    
    [controller.view addSubview:view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view verb_makeAnimation:^(VerbAnimator *animator) {
            animator.gravity.direction(VerbDirectionDown).magnitude(10);
            animator.collision.boundaryRect(CGRectMake(10.0, view.bounds.size.height - 1, view.bounds.size.width, view.bounds.size.height)).action(^{
                [UIView animateWithDuration:0.2 animations:^{
                    view.backgroundColor = [UIColor greenColor];
                }];
            });
        }];
    });
    
    
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

@end
