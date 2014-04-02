//
//  CARWheel.h
//  Car
//
//  Created by Jeffery Moulds on 4/1/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CARWheel : UIView

@property (nonatomic) NSString *rimSize;
@property (nonatomic) int tirePressure;
@property (nonatomic) NSString *brand;


- (void) fillWithAir;


@end
