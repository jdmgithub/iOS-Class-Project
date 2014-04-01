//
//  jmfAppDelegate.m
//  Empty App Test
//
//  Created by Jeffery Moulds on 4/1/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "jmfAppDelegate.h"

#import "jmfRootViewController.h"

@implementation jmfAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [[jmfRootViewController alloc] init];
    
    self.window.backgroundColor = [UIColor greenColor];

    [self.window makeKeyAndVisible];
    return YES;
}


@end
