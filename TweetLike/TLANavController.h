//
//  TLANavController.h
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLATableViewController;  // says I will init in the .m ... you will know what this is, compiler

@interface TLANavController : UINavigationController

-(void)addTableViewController:(TLATableViewController *)viewController;


@end
