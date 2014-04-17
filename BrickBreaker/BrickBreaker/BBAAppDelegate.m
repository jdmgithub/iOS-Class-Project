//
//  BBAAppDelegate.m
//  BrickBreaker
//
//  Created by Jeffery Moulds on 4/17/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "BBAAppDelegate.h"
#import "BBAViewController.h"

@implementation BBAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    
    //import BBAViewController then do this line to alloc / init
    
    self.window.rootViewController = [[BBAViewController alloc] initWithNibName:nil bundle:nil];

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
