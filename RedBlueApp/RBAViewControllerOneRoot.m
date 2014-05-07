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

@interface RBAViewControllerOneRoot ()

{
    RBAViewControllerTwoRed * secondVC;
    RBAViewControllerThreeBlue * thirdVC;

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
        int halfWidth = self.view.frame.size.height;
        
        secondVC.view.frame = CGRectMake(0, 0, halfWidth, halfHeight);
        secondVC.view.backgroundColor = [UIColor redColor];
        
        

        thirdVC = [[RBAViewControllerThreeBlue alloc] initWithNibName:nil bundle:nil];

        thirdVC.view.frame = CGRectMake(0, halfHeight, halfWidth, halfHeight);
        thirdVC.view.backgroundColor = [UIColor blueColor];

        [self.view addSubview:secondVC.view];
        [self.view addSubview:thirdVC.view];
        
        UILabel * redScore = [[UILabel alloc] initWithFrame:CGRectMake(145, 80, 60, 60)];
//        redScore.backgroundColor = [UIColor blackColor];
        redScore.tintColor = [UIColor blackColor];
        redScore.font = [UIFont systemFontOfSize:60];
        redScore.text = @"7";
        
        [self.view addSubview:redScore];
        
        
        
        
        UILabel * blueScore = [[UILabel alloc] initWithFrame:CGRectMake(145, 320, 60, 60)];

//        blueScore.backgroundColor = [UIColor blackColor];
        blueScore.tintColor = [UIColor blackColor];
        blueScore.font = [UIFont systemFontOfSize:60];
        blueScore.text = @"7";
        
        [self.view addSubview:blueScore];
       
        
        
        
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



@end
