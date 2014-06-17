//
//  WTFAnimal.m
//  Why Tests Fail
//
//  Created by Jeffery Moulds on 6/17/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "WTFAnimal.h"

@implementation WTFAnimal

-(void)setAmountOfLegs:(int)amountOfLegs
{

    _amountOfLegs = amountOfLegs;
    
    self.crawling = (amountOfLegs > 2);
    
    
    // logs values of what methods are being called
NSLog(@"Setting Legs \"%s\"", __PRETTY_FUNCTION__);

}

@end
