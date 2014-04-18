//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Jeffery Moulds on 4/17/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"

@interface BBAViewController () <BBALevelDelegate>

@end

@interface BBAViewController ()

{
    BBALevelController * level;
    UIButton * startButton;
    UILabel * statusBarLeft;
}



@end

@implementation BBAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization


        
        startButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.75, SCREEN_HEIGHT / 3.5, 160, 160)];
        [startButton setTitle:@"Start" forState:UIControlStateNormal];
        startButton.titleLabel.font = [UIFont systemFontOfSize:40];
        startButton.backgroundColor = [UIColor darkGrayColor];
        startButton.layer.cornerRadius = 80;
        
        [self.view addSubview:startButton];

        [startButton addTarget:self action:@selector(runResetLevel) forControlEvents:UIControlEventTouchUpInside];

        
    }
    return self;
}

-(void)gameDone
{
    [level.view removeFromSuperview];
    [self.view addSubview:startButton];

}

-(void)addPoints:(int)points
{
    statusBarLeft.text = [NSString stringWithFormat:@"Score: %d", points];
    

}


-(void)runResetLevel

{
    
    level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
    
    level.view.frame = CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:level.view];
    
    level.delegate = self;
    
    
    [self statusBarLeft];
    [self statusBarRight];
    [self statusBarCenter];
    
    [startButton removeFromSuperview];
    [level resetLevel];

}



-(void)statusBarLeft

{
    statusBarLeft = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    statusBarLeft.text = [NSString stringWithFormat:@"Score: "];
    //   statusBarLeft.text = [NSString stringWithFormat:@"Score: %f", points];
    statusBarLeft.textColor = [UIColor whiteColor];
    statusBarLeft.textAlignment = NSTextAlignmentCenter;
    statusBarLeft.font = [UIFont fontWithName:@"helveticaNeue" size:12];
    statusBarLeft.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:statusBarLeft];
}


-(void)statusBarRight

{
    UILabel * statusBarRight = [[UILabel alloc] initWithFrame:CGRectMake(380, 0, 100, 40)];
    statusBarRight.text = [NSString stringWithFormat:@"Balls: XXX"];
    statusBarRight.textColor = [UIColor whiteColor];
    statusBarRight.textAlignment = NSTextAlignmentCenter;
    statusBarRight.font = [UIFont fontWithName:@"helveticaNeue" size:12];
    
    
    statusBarRight.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:statusBarRight];
}

-(void)statusBarCenter

{
    UILabel * statusBarCenter = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 280, 40)];
    statusBarCenter.text = [NSString stringWithFormat:@"Super Terrific Brick Breaker"];
    statusBarCenter.textColor = [UIColor whiteColor];
    statusBarCenter.textAlignment = NSTextAlignmentCenter;
    statusBarCenter.font = [UIFont fontWithName:@"helveticaNeue" size:16];
    
    statusBarCenter.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:statusBarCenter];
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

- (BOOL)prefersStatusBarHidden { return YES; }


@end
