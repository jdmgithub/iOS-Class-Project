//
//  LPAViewController.m
//  LilPlayA
//
//  Created by Jeffery Moulds on 5/13/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "LPAViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface LPAViewController ()
{
    
    AVAudioPlayer * player;
    UIView * seekButton;
    UIView * progressBar;
    NSTimer * timer;
    UISlider *volumeSlider;
    float xPosition;
    UIButton * playButton;
    UILabel * songTimer;
    UIBarButtonItem * TEST;
    
}


@end

@implementation LPAViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        int w = [UIScreen mainScreen].bounds.size.width;
        int h = [UIScreen mainScreen].bounds.size.height;
        
        songTimer = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 25)];
        songTimer.backgroundColor = [UIColor magentaColor];
        [self.view addSubview:songTimer];
        
        
        playButton = [[UIButton alloc] initWithFrame:CGRectMake(10, (h-50) / 2, 50, 50)];
        playButton.backgroundColor = [UIColor greenColor];
        playButton.layer.cornerRadius = 25;

        
        [playButton setImage:[UIImage imageNamed:@"play43"] forState:UIControlStateNormal];
        [playButton setImage:[UIImage imageNamed:@"pause12"] forState:UIControlStateSelected];

// same as below
        
//        UIImage *playButtonImage = [UIImage imageNamed:@"play43"];
//
//        [playButton setImage:playButtonImage forState:UIControlStateNormal];
        
        [self.view addSubview:playButton];


        
        UIButton * stopButton = [[UIButton alloc] initWithFrame:CGRectMake( w - 60, (h - 50)/2, 50, 50)];
        stopButton.backgroundColor = [UIColor redColor];
        stopButton.layer.cornerRadius = 25;

        UIImage *stopButtonImage = [UIImage imageNamed:@"stop21"];
        
        [stopButton setImage:stopButtonImage forState:UIControlStateNormal];
       
        
        
        [self.view addSubview:stopButton];
        
        
        
        volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 50, 160, 10)];
        volumeSlider.minimumValue = 0.0;
        volumeSlider.maximumValue = 1.0;
//        volumeSlider.backgroundColor = [UIColor blackColor];
        [volumeSlider addTarget:self action:@selector(volumeControl) forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:volumeSlider];
        
        
        
        
        
        
        progressBar = [[UIView alloc] initWithFrame:CGRectMake(70, (h - 50)/2, w - 140, 2)];
        progressBar.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:progressBar];

        seekButton = [[UIView alloc] initWithFrame:CGRectMake(70, ((h - 50)/2)-5, 15, 15)];
        seekButton.backgroundColor = [UIColor blueColor];
        seekButton.layer.cornerRadius = 7.5;
        [self.view addSubview:seekButton];
        
        
        
// Gets on different threads.  This creates a thread.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^{
        
        // a url is not a string.  Make it one.
        NSURL * url = [NSURL URLWithString:@"https://api.soundcloud.com/tracks/147445565/download?client_id=2d87025c8392069f828c446b965862e3"];
        
        NSData * data = [NSData dataWithContentsOfURL:url];
        
// Puts us back on main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            player = [[AVAudioPlayer alloc] initWithData:data error:nil];
            
            [playButton addTarget:self action:@selector(startPlay:) forControlEvents:UIControlEventTouchUpInside];
            
//            [playButton addTarget:self action:@selector(pausePlay:) forControlEvents:UIControlEventTouchUpInside];
            
            [stopButton addTarget:self action:@selector(stopPlay) forControlEvents:UIControlEventTouchUpInside];
            
            NSLog(@"Player Ready");

            
//            NSTimer * progressTimer = [NSTimer alloc] initWithFireDate:<#(NSDate *)#> interval:<#(NSTimeInterval)#> target:<#(id)#> selector:<#(SEL)#> userInfo:<#(id)#> repeats:<#(BOOL)#>
            
        });
     
        
     
        
        
    });
    
    }
    return self;
}



-(void)startPlay:(UIButton *)sender
{
    if (sender.selected == NO)
    {
        sender.selected = YES;
        [player play];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateProgress:) userInfo:Nil repeats:YES];



        
        
        
    } else {
        sender.selected = NO;
 
        [player pause];

    }

}


-(void)updateProgress : (id)sender

{

    NSTimeInterval currentTime = [player currentTime];
    NSTimeInterval totalTime = [player duration];
    CGFloat progress = currentTime / totalTime;

    xPosition = progressBar.frame.origin.x + progress * progressBar.frame.size.width;
    
    NSLog(@"UpdateProgress Method");
    
    
    int h = [UIScreen mainScreen].bounds.size.height;
    
    seekButton.frame = CGRectMake(xPosition, ((h - 50)/2)-5, 15, 15);
    
//    player.currentTime = xPosition;
    xPosition = player.currentTime;
    
    NSLog(@"Button Postion: %f, Song Position %f", xPosition, player.currentTime);
    songTimer.text = [NSString stringWithFormat:@"Seconds Played: %0.02f", player.currentTime];

}


//
//
//-(void)pausePlay:(UIButton *)sender
//{
//    
//    if (sender.selected == NO) {
//        [player pause];
//    }
//    
//}


-(void)stopPlay

{
    int h = [UIScreen mainScreen].bounds.size.height;

    [player stop];
//    [self stopTimer];

    [timer invalidate];

    player.currentTime = 0;

    
    seekButton.frame = CGRectMake(70, ((h - 50)/2)-5, 15, 15);

    
    playButton.selected = NO;

}


//-(void)stopTimer
//{
//    [timer invalidate];
////    timer = nil;
//    
//    player.currentTime = 0;
//
//
//}



-(void) volumeControl
{
    player.volume = [volumeSlider value];
    
}




                   
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
