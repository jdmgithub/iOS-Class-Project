//
//  NAVsingleton.m
//  NavPracticeApp
//
//  Created by Jeffery Moulds on 5/18/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "NAVsingleton.h"

@implementation NAVsingleton


+(NAVsingleton *)mainData
{
    static dispatch_once_t create;
    static NAVsingleton * singleton = nil;
    
    dispatch_once(&create, ^{
        singleton = [[NAVsingleton alloc] init];
    });
    
    return singleton;
    
}





//-(id)init
//
//{
//    self = [super init];
//    if(self)
//    {
//        colors = [@[] mutableCopy];
//        numbers = [@[] mutableCopy];
//        
//    }
//    return self;
//}




@end
