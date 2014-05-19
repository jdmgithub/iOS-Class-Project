//
//  NAVsingleton.h
//  NavPracticeApp
//
//  Created by Jeffery Moulds on 5/18/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NAVsingleton : NSObject

@property (nonatomic) NSArray * colors;
@property (nonatomic) NSArray * numbers;

+(NAVsingleton *)mainData;






@end
