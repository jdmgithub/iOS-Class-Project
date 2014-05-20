//
//  STAViewControllerShare.h
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STAViewControllerShare : UIViewController

@property (nonatomic) NSArray * faces;
@property (nonatomic) NSString * face;
@property (nonatomic) int colorIndex;




- (void)setFaceWithIndex:(int)index;

@end
