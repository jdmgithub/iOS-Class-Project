//
//  PNAPixelWorld2ViewController.m
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/6/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PNAPixelWorld2ViewController.h"
#import "PNAPixelSounds.h"

@interface PNAPixelWorld2ViewController () <UICollisionBehaviorDelegate>

@property (nonatomic) UIDynamicAnimator * animator;
@property (nonatomic) UIGravityBehavior * gravity;
@property (nonatomic) UICollisionBehavior * collision;


@end

@implementation PNAPixelWorld2ViewController

{
    PNAPixelSounds * sounds;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
        sounds = [[PNAPixelSounds alloc] init];
        
        // animator is reference view
        // Add each behaviors to an animator; can have seperate animators
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        
        self.gravity = [[UIGravityBehavior alloc] init];
        [self.animator addBehavior:self.gravity];
        
        
        self.collision = [[UICollisionBehavior alloc] init];
        self.collision.translatesReferenceBoundsIntoBoundary = YES;

        // sets delegate
        self.collision.collisionDelegate = self;
        
        [self.animator addBehavior:self.collision];
        
      
    
    }
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint loc = [touch locationInView:self.view];
        [self createBlockWithLocation:loc];
    }
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch * touch in touches)
    {
        CGPoint loc = [touch locationInView:self.view];
        [self createBlockWithLocation:loc];
    }

}


-(void)createBlockWithLocation:(CGPoint)location
{
    
    UIView * block = [[UIView alloc] initWithFrame:CGRectMake(location.x, location.y, 10, 10)];
    
//    NSLog(@"block %@", block);
    
    block.backgroundColor = [UIColor blueColor];
    [self.view addSubview:block];
    [self.gravity addItem:block];
    [self.collision addItem:block];
    
}


// listens to delegate
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p

{
//    NSLog(@"%@", identifier);  // hitting an unspecified border (nil)

    UIView * collidedBlock = (UIView *)item;
    
//    NSLog(@"Collided Block %@", collidedBlock);
    
//    remove them to save memory.  Appears to have no floor.
    [self.gravity removeItem:collidedBlock];
    [self.collision removeItem:collidedBlock];
    [collidedBlock removeFromSuperview];
    
    
    [sounds playSoundWithName:@"drip"];
}



@end
