//
//  TIYBookingController.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYBookingController.h"

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
    
    UILabel * TIYText = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 150, 80, 150, 40)];
    //    titleText.backgroundColor = [UIColor redColor];
    TIYText.text = @"by TIY Travel, Inc.";
    TIYText.textColor = [UIColor blackColor];
    TIYText.textAlignment = NSTextAlignmentCenter;
    [TIYText setFont:[UIFont fontWithName:@"GillSans" size:20.0f]];
    [self.view addSubview:TIYText];

    
    
    
    
    
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
