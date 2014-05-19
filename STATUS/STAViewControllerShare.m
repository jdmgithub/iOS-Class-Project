//
//  STAViewControllerShare.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STAViewControllerShare.h"

@interface STAViewControllerShare ()

@end

@implementation STAViewControllerShare
{
    BOOL twitterIsSelected;
    BOOL googleIsSelected;
    BOOL facebookIsSelected;
    
    UIButton * googleButton;
    UIButton * twitterButton;
    UIButton * facebookButton;
    
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


    googleButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 24, 75, 48, 48)];

    [googleButton setImage:[UIImage imageNamed:@"sm_google_g.png"] forState:UIControlStateNormal];
    [googleButton addTarget:self action:@selector(googleClick) forControlEvents:UIControlEventTouchUpInside];
    
    // does not work
//    [googleButton setImage:[UIImage imageNamed:@"sM_google.png"] forState:UIControlStateSelected];

//    UIImage * grayGoogle = [UIImage imageNamed:@"sm_google_g.png"];
//    [googleButton setImage:grayGoogle forState:UIControlStateNormal];
    
    [self.view addSubview:googleButton];
    

    twitterButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 92, 75, 48, 48)];
    [twitterButton setImage:[UIImage imageNamed:@"sm_twitter_g.png"] forState:UIControlStateNormal];
    [twitterButton addTarget:self action:@selector(twitterClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twitterButton];
    
    
    facebookButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) + 45, 75, 48, 48)];
    [facebookButton setImage:[UIImage imageNamed:@"sm_facebook_g.png"] forState:UIControlStateNormal];
    [facebookButton addTarget:self action:@selector(facebookClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookButton];
    
    
    
    
    
    
    
    
    UIButton * bigSmile = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 96, (SCREEN_HEIGHT /2) - 96, 192, 192)];
    UIImage * bigSmileImage = [UIImage imageNamed:@"big_smilie.png"];
    [bigSmile setImage:bigSmileImage forState:UIControlStateNormal];
    [self.view addSubview:bigSmile];



    // Check
    UIButton * arrowButton = [[UIButton alloc] initWithFrame:CGRectMake(128, 496, 80, 56)];
    UIImage * arrowImage = [UIImage imageNamed:@"check.png"];
    [arrowButton setImage:arrowImage forState:UIControlStateNormal];
    [arrowButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowButton];

}


- (void)setfaceWithIndex:(int)index;
{


}




-(void)share

{


}

- (void)googleClick
{
    // change BOOL value then runs if conditional
    
    googleIsSelected = !googleIsSelected;
    if (googleIsSelected == YES) {
        [googleButton setImage:[UIImage imageNamed:@"sm_google.png"] forState:UIControlStateNormal];
    }
    if (googleIsSelected == NO) {
        [googleButton setImage:[UIImage imageNamed:@"sM_google_g.png"] forState:UIControlStateNormal];
    }
}

- (void)twitterClick
{
    twitterIsSelected = !twitterIsSelected;
    if (twitterIsSelected == YES) {
        [twitterButton setImage:[UIImage imageNamed:@"sm_twitter.png"] forState:UIControlStateNormal];
    }
    if (twitterIsSelected == NO) {
        [twitterButton setImage:[UIImage imageNamed:@"sm_twitter_g.png"] forState:UIControlStateNormal];
    }
}

- (void)facebookClick
{    
    facebookIsSelected = !facebookIsSelected;
    if (facebookIsSelected == YES) {
        [facebookButton setImage:[UIImage imageNamed:@"sm_facebook.png"] forState:UIControlStateNormal];
    }
    if (facebookIsSelected == NO) {
        [facebookButton setImage:[UIImage imageNamed:@"sm_facebook_g.png"] forState:UIControlStateNormal];
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

@end
