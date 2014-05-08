//
//  RBAViewControllerTwoRed.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAViewControllerTwoRed.h"
#import "RBAScoreSingleton.h"
#import "RBAScoreSingleton.h"

@interface RBAViewControllerTwoRed ()

@end

@implementation RBAViewControllerTwoRed

{
//UIView * redView;
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
    // setter
    [[RBAScoreSingleton sharedScores] updateRedScore];

    // getter
    NSLog(@"%d",(int)[RBAScoreSingleton sharedScores].redScore);
    
    // calling the method from root.m
    [self.delegate redTeamScores];
    
}



//-(void)teamScores
//
//{
//    [[RBAScoreSingleton sharedScores] updateRedScore];
//    
//}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
