//
//  STAViewControllerShare.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STAViewControllerShare.h"
#import "STTwitter.h"

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
    
    NSString * imageTitle;
    NSString * titleString;
    
    STTwitterAPI * twitter;

    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        

//        self.faces = @[@"yellow",@"red"];

        self.faces = @[
          @[
              @"yellow_1.png",
              @"yellow_2.png",
              @"yellow_3.png",
              @"yellow_4.png",
              @"yellow_5.png",
              @"yellow_6.png",
              @"yellow_7.png",
              @"yellow_8.png",
              @"yellow_9.png"
            ],
          @[
              @"angry_1.png",
              @"angry_2.png",
              @"angry_3.png",
              @"angry_4.png",
              @"angry_5.png",
              @"angry_6.png",
              @"angry_7.png",
              @"angry_8.png",
              @"angry_9.png"
            ]
        ];
    }
    return self;
}



- (void)setFaceWithIndex:(int)index
{
    
    self.face = self.faces[self.colorIndex][index];
//    self.redFace = self.redFaces[index];
    
//    NSLog(@"Face Tag: %@",self.face);
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    
//    if ([self.face isEqualToString:@"yellow_1.png"])
//    {imageTitle = @"yellow_1.png";}
//
//    if ([self.face isEqualToString:@"yellow_2.png"])
//    {imageTitle = @"yellow_2.png";}
//
//    if ([self.face isEqualToString:@"yellow_3.png"])
//    {imageTitle = @"yellow_3.png";}
//
//    if ([self.face isEqualToString:@"yellow_4.png"])
//    {imageTitle = @"yellow_4.png";}
//
//    if ([self.face isEqualToString:@"yellow_5.png"])
//    {imageTitle = @"yellow_5.png";}
//
//    if ([self.face isEqualToString:@"yellow_6.png"])
//    {imageTitle = @"yellow_6.png";}
//
//    if ([self.face isEqualToString:@"yellow_7.png"])
//    {imageTitle = @"yellow_7.png";}
//
//    if ([self.face isEqualToString:@"yellow_8.png"])
//    {imageTitle = @"yellow_8.png";}
//
//    if ([self.face isEqualToString:@"yellow_9.png"])
//    {imageTitle = @"yellow_9.png";}

    
// Set Up Ifs for Red Images:
//    if ([self.redFace isEqualToString:@"angry_1.png"])
//    {imageTitle = @"angry_1.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_2.png"])
//    {imageTitle = @"angry_2.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_3.png"])
//    {imageTitle = @"angry_3.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_4.png"])
//    {imageTitle = @"angry_4.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_5.png"])
//    {imageTitle = @"angry_5.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_6.png"])
//    {imageTitle = @"angry_6.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_7.png"])
//    {imageTitle = @"angry_7.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_8.png"])
//    {imageTitle = @"angry_8.png";}
//    
//    if ([self.redFace isEqualToString:@"angry_9.png"])
//    {imageTitle = @"angry_9.png";}

    
//    NSString * baseString = [NSString stringWithFormat:@"%@", imageTitle];
    
    
    imageTitle = self.face;
    
    UIButton * bigSmile = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 96, (SCREEN_HEIGHT /2) - 96, 192, 192)];
    UIImage * bigSmileImage = [UIImage imageNamed:imageTitle];
    [bigSmile setImage:bigSmileImage forState:UIControlStateNormal];
    [self.view addSubview:bigSmile];
    
  

//    googleButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 24, 75, 48, 48)];
//
//    [googleButton setImage:[UIImage imageNamed:@"sm_google_g.png"] forState:UIControlStateNormal];
//    [googleButton addTarget:self action:@selector(googleClick) forControlEvents:UIControlEventTouchUpInside];
    
    // does not work
//    [googleButton setImage:[UIImage imageNamed:@"sM_google.png"] forState:UIControlStateSelected];

//    UIImage * grayGoogle = [UIImage imageNamed:@"sm_google_g.png"];
//    [googleButton setImage:grayGoogle forState:UIControlStateNormal];
    
//    [self.view addSubview:googleButton];

    

    twitterButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 92, 75, 48, 48)];
    [twitterButton setImage:[UIImage imageNamed:@"sm_twitter_g.png"] forState:UIControlStateNormal];
    [twitterButton addTarget:self action:@selector(twitterClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:twitterButton];
    
    
    facebookButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) + 45, 75, 48, 48)];
    [facebookButton setImage:[UIImage imageNamed:@"sm_facebook_g.png"] forState:UIControlStateNormal];
    [facebookButton addTarget:self action:@selector(facebookClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebookButton];
    


    // Check
    UIButton * arrowButton = [[UIButton alloc] initWithFrame:CGRectMake(128, 496, 80, 56)];
    UIImage * arrowImage = [UIImage imageNamed:@"check.png"];
    [arrowButton setImage:arrowImage forState:UIControlStateNormal];
    [arrowButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowButton];

}




-(void)postTweet
{
    NSLog(@"Posted to Twitter");

    NSString *urlString = [NSString stringWithFormat:imageTitle];
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"%@", url);

    
    [twitter postStatusUpdate:nil inReplyToStatusID:nil mediaURL:url placeID:nil latitude:nil longitude:nil uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
        

        
        
    } successBlock:nil errorBlock:nil];
}


-(void)postFacebook
{
    
    NSLog(@"Posted to Facebook");
    
}



//- (void)googleClick
//{
//    // change BOOL value then runs if conditional
//    
//    googleIsSelected = !googleIsSelected;
//    if (googleIsSelected == YES) {
//        [googleButton setImage:[UIImage imageNamed:@"sm_google.png"] forState:UIControlStateNormal];
//    }
//    if (googleIsSelected == NO) {
//        [googleButton setImage:[UIImage imageNamed:@"sM_google_g.png"] forState:UIControlStateNormal];
//    }
//}

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




-(void)share

{
    if (twitterIsSelected == YES) {
        [self postTweet];
    };
    
    
    if (facebookIsSelected == YES) {
        [self postFacebook];
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
