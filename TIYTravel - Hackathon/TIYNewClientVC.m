//
//  TIYNewClientVC.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYNewClientVC.h"
#import "TIYBookingController.h"
#import "TIYCollectionVCNewClient.h"
#import "TAPCollectionViewController.h"
#import "TAPFBCollectionVC.h"

@interface TIYNewClientVC ()

@end

@implementation TIYNewClientVC

{
    UIView * header;
    UIView * pullView;
    UIScrollView * locationScrollView;
    UIView * bookingView;
    
    UIButton * bookingButton;

    float wh;

//    UIScrollView * scrollView;


    TIYCollectionVCNewClient * collectionVC;
    TAPCollectionViewController *collectVCFour;
    TAPFBCollectionVC *collectVCBook;

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


    
    UILabel * textBackgroundView = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 8, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .2)];
//    textBackgroundView.backgroundColor = [UIColor whiteColor];
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
    
    
    
    locationScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * .1, SCREEN_HEIGHT / 4, SCREEN_WIDTH * .8, SCREEN_HEIGHT * .1)];
//    locationScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview: locationScrollView];

//    int numScrollButtons = 8;
//    wh = locationScrollView.frame.size.height - 20;
//    int i = 0;
//    
//    for (int c = 0; c < numScrollButtons; c++, i++)
//    {
//        
//        
//        int x = (wh + 20) * i + 10;
//        
//        UIButton * locationButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 10, wh, wh)];
//        locationButton.tag = c;
//        locationButton.backgroundColor = [UIColor whiteColor];
//
//        [locationButton addTarget:self action:@selector(locationSelector:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [locationScrollView addSubview:locationButton];
//    }

    
    
    UIButton * locationButton1 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 240, 270, 80, 80)];
    locationButton1.backgroundColor = [UIColor blueColor];
    [locationButton1 setImage:[UIImage imageNamed:@"london.jpg"] forState:UIControlStateNormal];
    [locationButton1 addTarget:self action:@selector(location1Selector) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton1];
    
    
    
    
    UIButton * locationButton2 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 140, 270, 80, 80)];
    locationButton2.backgroundColor = [UIColor blueColor];
    [locationButton2 setImage:[UIImage imageNamed:@"madrid.jpg"] forState:UIControlStateNormal];
    [locationButton2 addTarget:self action:@selector(location2Selector) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton2];
    
    
    
    UIButton * locationButton3 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 40, 270, 80, 80)];
    locationButton3.backgroundColor = [UIColor blueColor];
    [locationButton3 setImage:[UIImage imageNamed:@"mumbai.jpg"] forState:UIControlStateNormal];
    [locationButton3 addTarget:self action:@selector(location3Selector) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton3];

    UIButton * locationButton4 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 + 60, 270, 80, 80)];
    locationButton4.backgroundColor = [UIColor blueColor];
    [locationButton4 setImage:[UIImage imageNamed:@"new york.jpg"] forState:UIControlStateNormal];
    [locationButton4 addTarget:self action:@selector(location4Selector) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton4];
    
    UIButton * locationButton5 = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 + 160, 270, 80, 80)];
    locationButton5.backgroundColor = [UIColor blueColor];
    [locationButton5 setImage:[UIImage imageNamed:@"orlando.jpg"] forState:UIControlStateNormal];
    [locationButton5 addTarget:self action:@selector(location5Selector) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton5];
    
    
    
    
    
    pullView = [[UIView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT / 3 + 45, SCREEN_WIDTH - 40, 580)];
//    pullView.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview: pullView];
    
    collectionVC = [[TIYCollectionVCNewClient alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    collectionVC.collectionView.frame = CGRectMake(0, 0, pullView.frame.size.width, pullView.frame.size.height);
    
//    [pullView addSubview:collectionVC.collectionView];
    

    
    
    bookingButton = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)];
    //    bookingButton.backgroundColor = [UIColor redColor];
    [bookingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bookingButton.backgroundColor = [UIColor darkGrayColor];
    [bookingButton setTitle:@"Book Your Vacation Today" forState:UIControlStateNormal];
    [bookingButton addTarget:self action:@selector(launchBookingVC) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    [self.view addSubview:bookingButton];
    
//    bookingView = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 150, SCREEN_HEIGHT - 170, 320, 100)];
//    bookingView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:bookingView];
    
    
    
//    UILabel * bookingText1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 2, 300, 30)];
//    //    introText2.backgroundColor = [UIColor redColor];
//    bookingText1.text = @"Moments";
//    bookingText1.textColor = [UIColor blackColor];
//    bookingText1.textAlignment = NSTextAlignmentCenter;
//    [bookingText1 setFont:[UIFont fontWithName:@"GillSans" size:30.0f]];
//    [bookingView addSubview:bookingText1];
//
//    
//    
//    UILabel * bookingText2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 50)];
//    //    introText2.backgroundColor = [UIColor redColor];
//    bookingText2.text = @"Let TIY Travel Create Them For You";
//    bookingText2.textColor = [UIColor blackColor];
//    bookingText2.textAlignment = NSTextAlignmentCenter;
//    [bookingText2 setFont:[UIFont fontWithName:@"GillSans" size:20.0f]];
//    [bookingView addSubview:bookingText2];
    
    
//    bookingButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 60, 200, 30)];
//    bookingButton.backgroundColor = [UIColor lightGrayColor];
//    [bookingButton setTitle:@"Book Now" forState:UIControlStateNormal];
//    [bookingButton addTarget:self action:@selector(launchBookingVC) forControlEvents:UIControlEventTouchUpInside];
//    [bookingView addSubview:bookingButton];
    
    
    
}


-(void)location1Selector
{
    collectVCFour = [[TAPCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [pullView addSubview:collectVCFour.collectionView];
}

-(void)location2Selector
{
    collectVCBook= [[TAPFBCollectionVC alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [pullView addSubview:collectVCBook.collectionView];

}

-(void)location3Selector
{
    collectVCFour = [[TAPCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [pullView addSubview:collectVCFour.collectionView];

}

-(void)location4Selector
{
    collectVCBook= [[TAPFBCollectionVC alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [pullView addSubview:collectVCBook.collectionView];

}

-(void)location5Selector
{
    collectVCFour = [[TAPCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [pullView addSubview:collectVCFour.collectionView];

}




-(void)locationSelector:(UIButton *)locationButton;

{
    
    
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
