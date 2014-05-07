//
//  RBAScoreSingleton.h
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RBAScoreSingleton : NSObject


+(RBAScoreSingleton *)sharedScores;

@property (nonatomic, readonly) NSInteger redScore;
@property (nonatomic, readonly) NSInteger blueScore;

-(void)updateRedScore;
-(void)updateBlueScore;


@end
