//
//  TIYBookingController.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYBookingController.h"
#import "TIYConfirmationVC.h"

@interface TIYBookingController ()

@end

@implementation TIYBookingController

{
    UIView * header;
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
    
    UIImage * image = [UIImage imageNamed:@"bookingScreen"];

    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(40,SCREEN_HEIGHT * .3, SCREEN_WIDTH - 80, SCREEN_HEIGHT * .4);
    
    [self.view addSubview:imageView]; 

    
    header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT * .06)];
    header.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: header];
    
    
    UILabel * titleText = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 40)];
    //    titleText.backgroundColor = [UIColor redColor];
    titleText.text = @"A TIME AND A PLACE";
    titleText.textColor = [UIColor blackColor];
    titleText.textAlignment = NSTextAlignmentCenter;
    [titleText setFont:[UIFont fontWithName:@"GillSans" size:50.0f]];
    [self.view addSubview:titleText];
    
    UILabel * TIYText = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 150, 50, 150, 40)];
    //    titleText.backgroundColor = [UIColor redColor];
    TIYText.text = @"by TIY Travel, Inc.";
    TIYText.textColor = [UIColor blackColor];
    TIYText.textAlignment = NSTextAlignmentCenter;
    [TIYText setFont:[UIFont fontWithName:@"GillSans" size:20.0f]];
    [self.view addSubview:TIYText];


    UILabel * fpoText = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT * .15, SCREEN_WIDTH - 40, 40)];
    //    titleText.backgroundColor = [UIColor redColor];
    fpoText.text = @"FPO - Vacation Booking";
    fpoText.textColor = [UIColor blackColor];
    fpoText.textAlignment = NSTextAlignmentCenter;
    [fpoText setFont:[UIFont fontWithName:@"GillSans" size:40.0f]];
    [self.view addSubview:fpoText];

    
    
    
    UIButton * confirmationButton = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
    //    bookingButton.backgroundColor = [UIColor redColor];
    [confirmationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmationButton.backgroundColor = [UIColor darkGrayColor];
    [confirmationButton setTitle:@"Trip Details" forState:UIControlStateNormal];
    [confirmationButton addTarget:self action:@selector(launchThankVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmationButton];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)launchThankVC
{
    
    TIYConfirmationVC * confirm = [[TIYConfirmationVC alloc] initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:confirm animated:YES];
    
}




-(BOOL)prefersStatusBarHidden {return YES;}

@end
