//
//  SCGstageVC.m
//  Squares
//
//  Created by Jeffery Moulds on 4/11/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGSquare.h"

#import "SCGCircle.h"



@interface SCGStageVC ()

@end

@implementation SCGStageVC

{
    int gameSize;

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

    gameSize = 4;
    
    float circleWidth = SCREEN_WIDTH / gameSize;

    for (float i = 0.0; i < gameSize * gameSize; i++)
    
    {// This assigns numbers to rows and colums
        NSLog(@"i = %f", i);
        
        float decimal = floor((i / gameSize) * 100) / 100;
        
        int row = floor(decimal);
        int col = ((decimal) - floorf(decimal)) * gameSize;

        NSLog(@"i / gameSize =%f", i / gameSize);

        NSLog(@"i : %f --- row : %d --- col : %d",i, row, col);

    
    
        float circleX = circleWidth * col;
        float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
    
        SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];

        circle.position = i;
        
        [self.view addSubview:circle];
    
    }



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

-(BOOL)prefersStatusBarHidden {return YES;}

@end
