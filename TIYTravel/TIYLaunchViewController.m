//
//  TIYLaunchViewController.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYLaunchViewController.h"

@interface TIYLaunchViewController ()


@end

@implementation TIYLaunchViewController

{

    UIView * header;
    UIView * pullView;
    UIButton * newClients;
    UIButton * existingClients;
    
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {


        self.view.backgroundColor = [UIColor lightGrayColor];
        
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * .15)];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: header];
    

    UILabel * titleText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 40)];
//    titleText.backgroundColor = [UIColor redColor];
    titleText.text = @"A TIME AND A PLACE";
    titleText.textColor = [UIColor blackColor];
    titleText.textAlignment = NSTextAlignmentCenter;
    [titleText setFont:[UIFont fontWithName:@"GillSans" size:50.0f]];
    [self.view addSubview:titleText];
    
    UILabel * TIYText = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 170, 80, 150, 40)];
    //    titleText.backgroundColor = [UIColor redColor];
    TIYText.text = @"by TIY Travel, Inc.";
    TIYText.textColor = [UIColor blackColor];
    TIYText.textAlignment = NSTextAlignmentCenter;
    [TIYText setFont:[UIFont fontWithName:@"GillSans" size:20.0f]];
    [self.view addSubview:TIYText];

    

    UILabel * textBackgroundView = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 5, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .2)];
    textBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textBackgroundView];
    
    
    
    UILabel * introText1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, (SCREEN_WIDTH * .8) - 40 , 50)];
//    introText1.backgroundColor = [UIColor redColor];
    introText1.text = @"Life Is Made Of Moments";
    introText1.textColor = [UIColor blackColor];
    introText1.textAlignment = NSTextAlignmentCenter;
    [introText1 setFont:[UIFont fontWithName:@"GillSans" size:35.0f]];
    [textBackgroundView addSubview:introText1];

    
    UILabel * introText2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, (SCREEN_WIDTH * .8) - 40 , 50)];
//    introText2.backgroundColor = [UIColor redColor];
    introText2.text = @"TIY Travel Clients Are Creating";
    introText2.textColor = [UIColor blackColor];
    introText2.textAlignment = NSTextAlignmentCenter;
    [introText2 setFont:[UIFont fontWithName:@"GillSans" size:35.0f]];
    [textBackgroundView addSubview:introText2];

    UILabel * introText3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, (SCREEN_WIDTH * .8) - 40 , 50)];
//    introText3.backgroundColor = [UIColor redColor];
    introText3.text = @"These Moments Right Now:";
    introText3.textColor = [UIColor blackColor];
    introText3.textAlignment = NSTextAlignmentCenter;
    [introText3 setFont:[UIFont fontWithName:@"GillSans" size:35.0f]];
    [textBackgroundView addSubview:introText3];

    
    
    
    
    
    pullView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 2 - 75, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .4)];
    pullView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview: pullView];
    
    
    
    newClients = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 220, SCREEN_HEIGHT - 120, 200, 50)];
    newClients.backgroundColor = [UIColor redColor];
    [newClients setTitle:@"New Clients" forState:UIControlStateNormal];
    [newClients addTarget:self action:@selector(newClientMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newClients];
    

    existingClients = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 120, 200, 50)];
    existingClients.backgroundColor = [UIColor redColor];
    [existingClients setTitle:@"Existing Clients" forState:UIControlStateNormal];
    [existingClients addTarget:self action:@selector(existingClientMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:existingClients];
    
    

}


-(void)newClientMethod
{

    
}



-(void)existingClientMethod
{


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
