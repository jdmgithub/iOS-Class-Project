//
//  RBAViewControllerTwoRed.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAViewControllerTwoRed.h"
#import "RBAScoreSingleton.h"

@interface RBAViewControllerTwoRed ()

@end

@implementation RBAViewControllerTwoRed

{
UIView * redView;
}


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



    
    
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    NSLog(@"Red Touch");
    
    [[RBAScoreSingleton sharedScores] updateRedScore];
    
    NSLog(@"%d",(int)[RBAScoreSingleton sharedScores].redScore);
    
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
