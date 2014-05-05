//
//  PNAViewController.m
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/5/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PNAViewController.h"
#import "PNAPixelSounds.h"

@interface PNAViewController ()

@end

@implementation PNAViewController


{
    PNAPixelSounds * sounds;
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        sounds = [[PNAPixelSounds alloc] init];
        
        
        
    }
    return self;
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

-(bool)preferStatusBarHidden { return YES;}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{

    NSLog(@"Play Sound");
    [sounds playSoundWithName:@"click_alert"];
    
    

}

@end
