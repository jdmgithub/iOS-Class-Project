//
//  TIYThankYou.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/8/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYThankYouVC.h"
#import "TIYLaunchViewController.h"

@interface TIYThankYouVC ()

@end

@implementation TIYThankYouVC

{

    UIView * header;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor lightGrayColor];

        
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
        fpoText.text = @"FPO - Enjoy Your Vacation";
        fpoText.textColor = [UIColor blackColor];
        fpoText.textAlignment = NSTextAlignmentCenter;
        [fpoText setFont:[UIFont fontWithName:@"GillSans" size:40.0f]];
        [self.view addSubview:fpoText];

        UILabel * upSellText = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT * .2, SCREEN_WIDTH - 40, 40)];
        //    titleText.backgroundColor = [UIColor redColor];
        upSellText.text = @"FPO - Thank You For Your Business";
        upSellText.textColor = [UIColor blackColor];
        upSellText.textAlignment = NSTextAlignmentCenter;
        [upSellText setFont:[UIFont fontWithName:@"GillSans" size:40.0f]];
        [self.view addSubview:upSellText];

    
        
        UIImage * image = [UIImage imageNamed:@"vacationBeach"];
        UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(40,SCREEN_HEIGHT * .3, SCREEN_WIDTH - 80, SCREEN_HEIGHT * .4);
        [self.view addSubview:imageView];

        

        UIButton * thankYouButton = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
        //    bookingButton.backgroundColor = [UIColor redColor];
        [thankYouButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        thankYouButton.backgroundColor = [UIColor darkGrayColor];
        [thankYouButton setTitle:@"Explore New Desitnations" forState:UIControlStateNormal];
        [thankYouButton addTarget:self action:@selector(reLaunch) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:thankYouButton];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)reLaunch
{

    NSArray * vcArray = [self.navigationController viewControllers];
    
    [self.navigationController popToViewController:[vcArray objectAtIndex:0] animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)prefersStatusBarHidden {return YES;}


@end
