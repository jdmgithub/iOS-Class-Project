//
//  STAViewControllerFaces.h
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAViewControllerFaces : UIViewController

@property (nonatomic) NSArray * colors;
@property (nonatomic) NSString * color;

- (void)setColorWithIndex:(int)index;

@end
