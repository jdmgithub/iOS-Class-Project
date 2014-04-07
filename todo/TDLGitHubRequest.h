//
//  TDLGitHubRequest.h
//  todo
//
//  Created by Jeffery Moulds on 4/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TDLGitHubRequest : NSObject

+ (NSDictionary *)getUserWithUsername:(NSString *)username; 

@end
