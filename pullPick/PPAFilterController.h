//
//  PPAFilterController.h
//  pullPick
//
//  Created by Jeffery Moulds on 5/1/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PPAFilterControllerDelegate;

@interface PPAFilterController : UIViewController

@property (nonatomic, assign) id<PPAFilterControllerDelegate> delegate;

@property (nonatomic, weak) UIImage * imageToFilter;


@end


@protocol PPAFilterControllerDelegate <NSObject>

-(void)updateCurrentImageWithFilteredImage: (UIImage *)image;

@end