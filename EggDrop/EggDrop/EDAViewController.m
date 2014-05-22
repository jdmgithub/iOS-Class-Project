//
//  EDAViewController.m
//  EggDrop
//
//  Created by Jeffery Moulds on 5/22/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "EDAViewController.h"
#import <CoreMotion/CoreMotion.h>
#import <AVFoundation/AVFoundation.h>


////////////


//// Add Touch to move spoon (touch inside handle) and slide spoon
//// make egg more sensitive (line 43ish)
//// egg roll off edge and not sit halfway on it.  Fall outide spoon.
//// add splatter noise sound
//// change egg image to cracked egg
// crack egg if touched



@interface EDAViewController ()

@property (nonatomic) AVAudioPlayer * player;




@end

@implementation EDAViewController

{
    
    CMMotionManager * mManager;
    
    BOOL eggIsFalling;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mManager = [[CMMotionManager alloc] init];
    [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        
        //        float x = motion.userAcceleration.x;
        float roll  = motion.attitude.roll * 20;
        
        
        // if statement allows move.  If falling, wont move.
        if(!eggIsFalling) self.Egg.frame = CGRectOffset(self.Egg.frame, roll, 0);
        
        
        float eggMidX = CGRectGetMidX(self.Egg.frame);
        float spoonMidX = CGRectGetMidX(self.Spoon.frame);
        
        if (fabs(spoonMidX - eggMidX) > self.Egg.frame.size.width/2.0 && !eggIsFalling)
        {
            eggIsFalling = YES;
            
//            [UIView animateWithDuration:0.3 animations:^{
//                
//                float x = self.Egg.frame.origin.x + self.Egg.frame.size.width / 4.0;
//                float y = self.Egg.frame.origin.y + self.Egg.frame.size.width / 4.0;
//                float w = self.Egg.frame.size.width /2.0;
//                float h = self.Egg.frame.size.height /2.0;;
//                
//                self.Egg.frame = CGRectMake(x, y, w, h);
//            
//            }];
            
            
            
            [UIView animateWithDuration:0.3 animations:^{
                float x = self.Egg.frame.origin.x + self.Egg.frame.size.width / 4.0;
                float y = self.Egg.frame.origin.y + self.Egg.frame.size.width / 4.0;
                float w = self.Egg.frame.size.width /2.0;
                float h = self.Egg.frame.size.height /2.0;;
                
                self.Egg.frame = CGRectMake(x, y, w, h);

            } completion:^(BOOL finished)
            {

                self.Egg.image = [UIImage imageNamed:@"babychick3"];
                [self playSoundWithName:@"peeps"];
                [self resetButton];
                
            }];
        }
    }];

    
}

-(void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];

    NSURL * url = [[NSURL alloc] initFileURLWithPath:file];
    
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];

    [self.player play];
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveMySpoon:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self moveMySpoon:touches];
}

- (void)moveMySpoon: (NSSet *)touches
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInView:self.view];
        self.Spoon.frame = CGRectMake(location.x - (self.Spoon.frame.size.width/2.0), self.Spoon.frame.origin.y, self.Spoon.frame.size.width, self.Spoon.frame.size.height);
    }
}


-(void)resetButton
{
    UIButton * reset = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 70, 70)];
    reset.backgroundColor = [UIColor greenColor];
    reset.layer.cornerRadius = 35;
    [reset setTitle:@"Reset" forState:UIControlStateNormal];
    [reset addTarget:self action:@selector(resetGame) forControlEvents:UIControlEventTouchUpInside];
//    [self.Spoon addSubview:reset];
//    [self.Egg addSubview:reset];
    [self.view addSubview:reset];

}

-(void)resetGame
{

    self.Egg.image = [UIImage imageNamed:@"egg"];
    eggIsFalling = NO;
    NSLog(@"Reset Button Click");

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
