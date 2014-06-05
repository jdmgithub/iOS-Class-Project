//
//  RDAFourSquareRequest.h
//  RandomDestination
//
//  Created by Jeffery Moulds on 6/5/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDAFourSquareRequest : NSObject

+ (NSArray *)getVenuesWithLat:(double)lat andLong:(double)longitude;




@end
