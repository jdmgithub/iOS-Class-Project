//
//  RBAScoreSingleton.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAScoreSingleton.h"

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

//-(id)init
//
//{
//    self = [super init];
//    
//    if(self){
//    _redScore = 0;
//    }
//
////    NSLog(@"%d",(int)[RBAScoreSingleton sharedScores].redScore);
//    return self;
//    
//}


-(void)updateRedScore;
{
    _redScore ++;
//  or
//  _redScore++;
    
    NSLog(@"update %d",_redScore);
    
}


-(void)updateBlueScore;
{

    _blueScore ++;

}


@end
