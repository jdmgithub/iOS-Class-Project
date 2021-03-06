//
//  RBAViewControllerThreeBlue.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAViewControllerThreeBlue.h"
#import "RBAScoreSingleton.h"

@interface RBAViewControllerThreeBlue ()

@end

@implementation RBAViewControllerThreeBlue

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    NSLog(@"Blue Touch");
    
    [[RBAScoreSingleton sharedScores] updateBlueScore];
    
    NSLog(@"%d",(int)[RBAScoreSingleton sharedScores].blueScore);
    
    [self.delegate blueTeamScores];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
