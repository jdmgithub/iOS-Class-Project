//
//  TIYNewClientVC.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYNewClientVC.h"
#import "TIYBookingController.h"

@interface TIYNewClientVC ()

@end

@implementation TIYNewClientVC

{
    UIView * header;
    UIView * pullView;
    UIView * locationView;
    UIView * bookingView;
    
    UIButton * bookingButton;
    
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


    
    UILabel * textBackgroundView = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 5, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .15)];
    textBackgroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textBackgroundView];
    
    
    UILabel * introText1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, (SCREEN_WIDTH * .8) - 40 , 50)];
//    introText1.backgroundColor = [UIColor redColor];
    introText1.text = @"Where Do You Want";
    introText1.textColor = [UIColor blackColor];
    introText1.textAlignment = NSTextAlignmentCenter;
    [introText1 setFont:[UIFont fontWithName:@"GillSans" size:35.0f]];
    [textBackgroundView addSubview:introText1];
    
    
    UILabel * introText2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, (SCREEN_WIDTH * .8) - 40 , 50)];
//    introText2.backgroundColor = [UIColor redColor];
    introText2.text = @"To Create Your Moments?";
    introText2.textColor = [UIColor blackColor];
    introText2.textAlignment = NSTextAlignmentCenter;
    [introText2 setFont:[UIFont fontWithName:@"GillSans" size:35.0f]];
    [textBackgroundView addSubview:introText2];
    
    
    
    locationView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 3 + 40, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .1)];
    locationView.backgroundColor = [UIColor redColor];
    [self.view addSubview: locationView];

    
    pullView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 2, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .3)];
    pullView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview: pullView];

    
    
    bookingView = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 150, SCREEN_HEIGHT - 170, 320, 100)];
    bookingView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bookingView];
    
    
    
    UILabel * bookingText1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 300, 30)];
    //    introText2.backgroundColor = [UIColor redColor];
    bookingText1.text = @"Moments";
    bookingText1.textColor = [UIColor blackColor];
    bookingText1.textAlignment = NSTextAlignmentCenter;
    [bookingText1 setFont:[UIFont fontWithName:@"GillSans" size:30.0f]];
    [bookingView addSubview:bookingText1];

    
    
    UILabel * bookingText2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 50)];
    //    introText2.backgroundColor = [UIColor redColor];
    bookingText2.text = @"Let TIY Travel Create Them For You";
    bookingText2.textColor = [UIColor blackColor];
    bookingText2.textAlignment = NSTextAlignmentCenter;
    [bookingText2 setFont:[UIFont fontWithName:@"GillSans" size:20.0f]];
    [bookingView addSubview:bookingText2];
    
    
    bookingButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 60, 200, 30)];
    bookingButton.backgroundColor = [UIColor lightGrayColor];
    [bookingButton setTitle:@"Book Now" forState:UIControlStateNormal];
    [bookingButton addTarget:self action:@selector(launchBookingVC) forControlEvents:UIControlEventTouchUpInside];
    [bookingView addSubview:bookingButton];
    
    
    
}


-(void)launchBookingVC

{

    TIYBookingController * bookingVC = [[TIYBookingController alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:bookingVC animated:YES];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden {return YES;}


@end
