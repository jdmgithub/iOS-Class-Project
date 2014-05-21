//
//  STAViewControllerShare.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STAViewControllerShare.h"
#import "STTwitter.h"
#import <CoreLocation/CoreLocation.h>


@interface STAViewControllerShare () <CLLocationManagerDelegate>

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
    
    UIImage * bigSmileImage;
    
    STTwitterAPI * twitter;

    CLLocationManager * lManager;
    CLLocation * currentLocation;
    
    NSString * locationLat;
    NSString * locationLong;
    
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
    
    
    lManager = [[CLLocationManager alloc] init];
    
    lManager.delegate = self;
    
    lManager.distanceFilter = 1000;
    
    //        lManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    [lManager startUpdatingLocation];

// twitter Login
    twitter = [STTwitterAPI twitterAPIOSWithFirstAccount];
    
    [twitter verifyCredentialsWithSuccessBlock:^(NSString *username)
     {
         NSLog(@"%@", username);
         
     } errorBlock:^(NSError *error) {
         
         NSLog(@"%@", error.userInfo);
     }];
    
    
    
    
    return self;
}


//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    currentLocation = newLocation;
//    NSLog(@"%@", currentLocation);
//}



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    

    currentLocation = [locations objectAtIndex:0];
    [lManager stopUpdatingLocation];
    
    
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        
        [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {

 
            CLPlacemark * placemark = [placemarks objectAtIndex:0];
            NSLog(@"Current Location Detected");
            NSLog(@"placemark %@", placemark);
            NSString * locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"]componentsJoinedByString:@","];
            NSString * address = [[NSString alloc]initWithString:locatedAt];
            NSString * area = [[NSString alloc]initWithString:placemark.locality];
            NSLog(@"%@, %@", address, area);
            
        }];
 
    locationLat = [[NSString alloc] initWithFormat:@"%g", currentLocation.coordinate.latitude];
    locationLong = [[NSString alloc] initWithFormat:@"%g", currentLocation.coordinate.longitude];

    
    
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
    
    imageTitle = self.face;
    
    UIButton * bigSmile = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 96, (SCREEN_HEIGHT /2) - 96, 192, 192)];
    bigSmileImage = [UIImage imageNamed:imageTitle];
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

//    NSArray *locations = [[NSArray alloc] init];
//    
//    currentLocation = [locations objectAtIndex:0];
    
//    locationLat = [[NSString alloc] initWithFormat:@"%g", currentLocation.coordinate.latitude];
//    locationLong = [[NSString alloc] initWithFormat:@"%g", currentLocation.coordinate.longitude];
    
//    NSLog(@"Lat:  %@", lat);
//    NSLog(@"Long:  %@", lng);
//    NSLog(@"%@", currentLocation);
    
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentPath = paths[0];
    
    NSData * imageData = UIImagePNGRepresentation(bigSmileImage);
    
    NSString* pngPath = [documentPath stringByAppendingPathComponent:@"yellow_1.png"];
    [imageData writeToFile:pngPath atomically:YES];
    NSURL * url = [NSURL fileURLWithPath:pngPath];
    
    [twitter postStatusUpdate:@"app test" inReplyToStatusID:nil mediaURL:url placeID:nil latitude:locationLat longitude:locationLong uploadProgressBlock:^(NSInteger bytesWritten, NSInteger totalBytesWritten, NSInteger totalBytesExpectedToWrite) {
        NSLog(@"posted!");
    } successBlock:^(NSDictionary *status) {
        
//        NSLog(@"%@", status);
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@", error.userInfo);
    }];




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
}



@end
