//
//  PPACustomCIFilter.h
//  pullPick
//
//  Created by Jeffery Moulds on 5/2/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <CoreImage/CoreImage.h>

@interface PPACustomCIFilter : CIFilter

@property (nonatomic) NSNumber * inputRadius;

@property (nonatomic) CIImage * inputImage;

@property (nonatomic) NSValue * inputTransform;


@end
