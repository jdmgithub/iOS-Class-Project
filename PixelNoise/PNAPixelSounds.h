//
//  PNAPixelSounds.h
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/5/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVFoundation/AVFoundation.h"

@interface PNAPixelSounds : NSObject //<AVAudioPlayerDelegate>


@property (nonatomic) AVAudioPlayer * player;
@property (nonatomic) NSMutableArray * players;


-(void)playSoundWithName:(NSString *)soundName;


@end
