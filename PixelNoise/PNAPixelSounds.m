//
//  PNAPixelSounds.m
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/5/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PNAPixelSounds.h"

@implementation PNAPixelSounds




-(void)playSoundWithName:(NSString *)soundName

{

    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSData *fileData = [NSData dataWithContentsOfFile:file];
    
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
// default is 0 ... will play one time (ie no loops) (neg number continual loops)

    //    self.player.numberOfLoops = 0;
    
    [self.player play];

}


@end
