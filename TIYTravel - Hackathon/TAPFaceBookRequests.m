//
//  TAPFaceBookRequests.m
//  Time and Place
//
//  Created by Savitha Reddy on 6/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "TAPFaceBookRequests.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>


@implementation TAPFaceBookRequests

+(NSMutableArray *)getPhotosWithFaceB
{
    NSMutableArray *photosFbook = [@[]mutableCopy];
    
    NSURL *requestURL = [NSURL URLWithString:@"https://graph.facebook.com/me/photos/uploaded?access_token=CAACEdEose0cBANyCys4m2SZBXwqZCF5KQAdIZCjJ77XWlcqJBenq9fgXomhOW0ptZBJfYmtxiZBsM3XyeziZBV8Ro2Ox7gxwq1tkmgG4AEyfnHBH1NPz01afJbbhLBFmB34T41F7ZCwtzzfyHUevXvllUB0WB2RZAXe4UkKghXaLstQSlY4EHbkmCz4xxC2djuzwAtaktx7mHAZDZD"];

//    SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeFacebook
//                                        requestMethod:SLRequestMethodGET
//                                                  URL:requestURL
//                                           parameters:nil];
//    //request.account = self.facebookAccount;
//    [request performRequestWithHandler:^(NSData *data,
//                                     NSHTTPURLResponse *response,
//                                     NSError *error) {
    
        NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
        NSData *resonseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//	if(!error){
        NSDictionary *list =[NSJSONSerialization JSONObjectWithData:resonseData
                                                            options:kNilOptions error:nil];
        
         
//        NSLog(@"Dictionary contains: %@", list );
        for (int index = 2 ; index < 6; index ++) {
         NSString *name = list[@"data"][index] [@"source"];
//    NSString *coverPhoto = list[@"data"][index][@"name"];
//            NSString *description = list[@"data"][index] [@"description"];
//            NSString *location = list[@"data"][index] [@"location"];
//                        NSString *photo = [NSString stringWithFormat:@"https://graph.facebook.com/%@/photos",coverPhoto];
            [photosFbook addObject:name];
//            [photosFbook addObjectsFromArray:[NSArray arrayWithObjects:name,coverPhoto, nil]];
//            NSLog(@"cover photo is %@",name);
//           NSLog(@"photos array has %@ ",photosFbook);
        }
//        }
//    }
//    else{[index] [@"images"] [@"source"] ;
//        //handle error gracefully
//    }
//    
//}];
//  NSLog(@"photos array has %@ ",photosFbook);
    return photosFbook;
}


@end

