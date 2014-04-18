//
//  BBALevelController.h
//  BrickBreaker
//
//  Created by Jeffery Moulds on 4/17/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BBALevelDelegate;

@interface BBALevelController : UIViewController

@property (nonatomic, assign) id<BBALevelDelegate> delegate;

- (void)resetLevel;


@end

@protocol BBALevelDelegate <NSObject>

@optional

-(void)addPoints:(int)points;
-(void)gameDone;

@end


