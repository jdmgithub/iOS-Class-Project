//
//  RBAViewControllerOneRoot.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAViewControllerOneRoot.h"
#import "RBAViewControllerTwoRed.h"
#import "RBAViewControllerThreeBlue.h"
#import "RBAScoreSingleton.h"

@interface RBAViewControllerOneRoot () <VCTwoRedScoreDelegate>

{
    RBAViewControllerTwoRed * secondVC;
    RBAViewControllerThreeBlue * thirdVC;
    
    UILabel * blueScore;
    UILabel * redScore;
    

}

@end

@implementation RBAViewControllerOneRoot

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        secondVC = [[RBAViewControllerTwoRed alloc] initWithNibName:nil bundle:nil];
        
        int halfHeight = self.view.frame.size.height /2;
        int halfWidth = self.view.frame.size.width;
        int height = self.view.frame.size.height;
        int width = self.view.frame.size.width;
        
        
        secondVC.view.frame = CGRectMake(0, 0, halfWidth, halfHeight);
        secondVC.view.backgroundColor = [UIColor redColor];
        
        

        thirdVC = [[RBAViewControllerThreeBlue alloc] initWithNibName:nil bundle:nil];

        thirdVC.view.frame = CGRectMake(0, halfHeight, halfWidth, halfHeight);
        thirdVC.view.backgroundColor = [UIColor blueColor];

        [self.view addSubview:secondVC.view];
        [self.view addSubview:thirdVC.view];
        
        redScore = [[UILabel alloc] initWithFrame:CGRectMake(width /2 -15, halfHeight -150, 50, 50)];
//        redScore.backgroundColor = [UIColor blackColor];
        redScore.tintColor = [UIColor blackColor];
        redScore.font = [UIFont systemFontOfSize:40];
//        redScore.text = @"";
        
        [self.view addSubview:redScore];
        
        
        
        
        blueScore = [[UILabel alloc] initWithFrame:CGRectMake(width /2 -15, halfHeight + 100, 50, 50)];

//        blueScore.backgroundColor = [UIColor blackColor];
        blueScore.tintColor = [UIColor blackColor];
        blueScore.font = [UIFont systemFontOfSize:40];
 //       blueScore.text = @"7";
        
        [self.view addSubview:blueScore];
       
    
        secondVC.delegate = self;
        thirdVC.delegate = self;
    }
    return self;
}


-(void)redTeamScores

{
    // getter getting game score
    redScore.text = [NSString stringWithFormat:@"%i", [RBAScoreSingleton sharedScores].redScore];
}


-(void)blueTeamScores
{
    // getter getting game score
    blueScore.text = [NSString stringWithFormat:@"%i", [RBAScoreSingleton sharedScores].blueScore];


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



@end
