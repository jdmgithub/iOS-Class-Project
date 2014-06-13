//
//  TAPFourSquareRequests.m
//  Time and Place
//
//  Created by Savitha Reddy on 6/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#define ID @"43695300f964a5208c291fe3"
//#define ID  @"U5LGPWWMKMNBT4VZ3TCKKRHC2R3LHVTWGN3NEGJWY2M1D15P"
#import "TAPFourSquareRequests.h"

@implementation TAPFourSquareRequests

+(NSArray *)getPhotosWithVenues
{
    NSMutableArray *photos = [@[] mutableCopy];
    
    NSString *locationURL = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/%@/photos?oauth_token=FMJPXMBCP0CHUBZGJYM52NW3PX5T3MASQOESIEWVW3ECHBCZ&v=20140607",ID];
    
   
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:locationURL]];
    NSData *resonseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *fsInfo = [NSJSONSerialization JSONObjectWithData:resonseData options:0 error:nil];
//    NSLog(@"DIctionary is %@",fsInfo);
    
    for (int index = 0 ; index < 4; index ++) {
        NSString *photos1 = fsInfo[@"response"][@"photos"][@"items"] [index] [@"prefix"];
        NSString *photos2 = fsInfo[@"response"][@"photos"][@"items"] [index] [@"suffix"];
        NSString *photos3 = fsInfo[@"response"][@"photos"][@"items"] [index] [@"width"];
        NSString *photos4 = fsInfo[@"response"][@"photos"][@"items"] [index] [@"height"];
        NSString *joinString=[NSString stringWithFormat:@"%@%@x%@%@",photos1,photos3,photos4,photos2];
        [photos addObject:joinString];
        }
//    NSLog(@" photos %@",photos);
    return photos;

}

@end
