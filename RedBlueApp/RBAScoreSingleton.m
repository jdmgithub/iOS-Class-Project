//
//  RBAScoreSingleton.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAScoreSingleton.h"
#import "RBAViewControllerTwoRed.h"

@implementation RBAScoreSingleton 

+(RBAScoreSingleton *)sharedScores
{
    static dispatch_once_t create;
    static RBAScoreSingleton * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[RBAScoreSingleton alloc] init];
    });
    
    return singleton;
    
    
}




-(void)updateRedScore;
{
//    _redScore ++;
//  or
  _redScore = _redScore +1;
    
    NSLog(@"update %d",_redScore);
    
}


-(void)updateBlueScore;
{
    _blueScore = _blueScore +1;
//    _blueScore ++;

}


@end
