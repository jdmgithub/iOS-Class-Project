//
//  PNAPixelWorld2ViewController.m
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/6/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PNAPixelWorld2ViewController.h"

@interface PNAPixelWorld2ViewController ()

@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIGravityBehavior * gravity;
@property (nonatomic) UICollisionBehavior * collision;


@end

@implementation PNAPixelWorld2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // animator is reference view
        // Add each behaviors to an animator; can have seperate animators
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        self.gravity = [[UIGravityBehavior alloc] init];
        [self.animator addBehavior:self.gravity];
        
        
        self.collision = [[UICollisionBehavior alloc] init];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:self.collision];
        
        
        
        UIView * block = [[UIView alloc] initWithFrame:CGRectMake(160, 50, 20, 20)];
        block.backgroundColor = [UIColor blueColor];
        [self.view addSubview:block];
        [self.gravity addItem:block];
        [self.collision addItem:block];
        
        
    
    }
    return self;
}










@end
