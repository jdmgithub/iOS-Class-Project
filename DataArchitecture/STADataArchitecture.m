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
    
    NSDictionary * faces;
    
    int chosenColorIndex;
    int chosenFaceIndex;
}


-(NSDictionary *)returnChosenFace
{

    return colors[chosenColorIndex][@"faces"][chosenFaceIndex];

}


-(void)addFace:(NSDictionary *)face withColor:(int)colorIndex
{
    
    [colors[colorIndex][@"faces"] addObject:face];

}

-(void)setUpArchitecture
{

//                        this is main colors array
//                        | this is the 1st dictionary in array
//                        | |   this is the array of faces in 1st dictionary
//                        | |    |       this is the object at position 1 in the 1st dictionary
//                        | |    |       |
//                        | |    |       |
    NSArray * face = colors[0][@"faces"][1];

    
    
    
    
    
    
    
    colors = [@{
                @"yellow" : @"image1",
                @"red" : @"image2",
               } mutableCopy];
    
    
    faces = @{
              @"yellow" : @[@"face1, face1"],
              @"red" : @[@"face1, face1"],
              };
    
    

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
//    NSString * yellowKey = [colorDictionary allKeys][0];
//    NSDictionary * yellowColor = colorDictionary[yellowKey];
    
    
    
    
    for (NSString * key in [colorDictionary allKeys])
    {
        NSDictionary * color = colorDictionary[key];
        
        NSLog(@"%@", color);
        
        [self createFaceswithColor:key];
        
    }
    
    
    
    for (NSDictionary * color in colors)
    {
        NSString * imageFileName = color[@"image"];
        
//        NSLog(@"image file : %@", imageFileName);

        [self createFaceswithColorDictionary:color];
        
        
        NSDictionary * face = colors[0][@"image"][1][@"image"];
        // gets second itemm from colors dictationary with key "image"
        
    }
    
}
    

-(void)createFaceswithColor:(NSString *)color
{
    NSArray * faces = colorDictionary[color][@"faces"];
    
    for (NSDictionary * face in faces)
    {
        NSLog(@"%@", face);
    }
    
    
}

-(void)createFaceswithColorDictionary:(NSDictionary *)color
{
    
    NSString * faces = color[@"faces"];
    
    for (NSDictionary * face in faces)
    {
        NSLog(@"%@", face);
    }
    
    
    
}



    

@end
