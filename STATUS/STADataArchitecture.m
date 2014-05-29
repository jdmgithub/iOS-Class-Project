//
//  STADataArchitecture.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/29/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STADataArchitecture.h"

@implementation STADataArchitecture

{
    NSArray * colors;
    NSMutableDictionary * colorDictionary;
    
}

-(void)setUpArchitecture
{

    colorDictionary = [@{
                        @"yellow": @{
                                @"image": @"colors0",
                                @"faces": [@[
                                        @{
                                            @"emotion": @"happy",
                                            @"image": @"yellow0"
                                            },
                       
                                        @{
                                            @"emotion": @"smirk",
                                            @"image": @"yellow1"
                                            },
                                        ] mutableCopy]
                                },
    
                        @"red" : @{
                                @"image" : @"colors1",
                                @"faces" : @[],
                                }
                        
                        } mutableCopy];

    

//    NSArray * colors = [[NSArray alloc] init];
// or
    colors = @[
                         @{
                             @"color": @"yellow",
                             @"image": @"colors0",
                             @"faces": @[
                                            @{
                                                @"emotion": @"happy",
                                                @"image": @"yellow0"
                                            },
                                     
                                            @{
                                                @"emotion": @"smirk",
                                                @"image": @"yellow1"
                                              },
                                     ]
                             },
                         @{
                             @"color": @"red",
                             @"image": @"colors1"
                             },
                         @{
                             @"color": @"blue",
                             @"image": @"colors2"
                             },
                         @{
                             @"color": @"orange",
                             @"image": @"colors3"
                             },
                         @{},
                         @{},
                         @{},
                         @{},
                         @{},
                         ];
}
- (void)createColors
{
    NSString * yellowKey = [colorDictionary allKeys][0];
    NSDictionary * yellowColor = colorDictionary[yellowKey];
    
    
    for (NSString * key in [colorDictionary allKeys])
    {
        NSDictionary * color = colorDictionary[key];
        
        NSLog(@"%@", color);
        
    }
    
    
    
    for (NSDictionary * color in colors)
    {
        NSString * imageFileName = color[@"image"];
        imageFileName = [color objectForKey:@"image"];
        UIImage * colorImage = [UIImage imageNamed:imageFileName];
        
    }
    
}
    

-(void)createFaceswithColor:(NSString *)color
{

    
}

-(void)createFaceswithColorDictionary:(NSString *)color
{
    
    
}



    

@end
