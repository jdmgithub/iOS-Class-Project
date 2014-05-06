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

// Shards
@property (nonatomic) UIDynamicItemBehavior * shardBehavior;
@property (nonatomic) UICollisionBehavior * shardCollision;


@end

@implementation PNAPixelWorld2ViewController

{
    PNAPixelSounds * sounds;
    
    NSArray * splatterDirections;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
        sounds = [[PNAPixelSounds alloc] init];

// cant put cstruct in array... must use object
        splatterDirections = @[
                            [NSValue valueWithCGPoint:CGPointMake(-.1, -0.1)],
                            [NSValue valueWithCGPoint:CGPointMake(-0.05, -0.1)],
                            [NSValue valueWithCGPoint:CGPointMake(0.0, -0.1)],
                            [NSValue valueWithCGPoint:CGPointMake(0.05, -0.1)],
                            [NSValue valueWithCGPoint:CGPointMake(0.1, -0.1)],
                            
                             ];
        
        
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

        
        self.shardBehavior = [[UIDynamicItemBehavior alloc] init];
        self.shardBehavior.density = 10;
        [self.animator addBehavior:self.shardBehavior];

        
        self.shardCollision = [[UICollisionBehavior alloc] init];
        self.shardCollision.translatesReferenceBoundsIntoBoundary = YES;
        // sets delegate
        self.shardCollision.collisionDelegate = self;
        [self.animator addBehavior:self.shardCollision];

        
    
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
    
    if ([behavior isEqual:self.collision])
        {
            [sounds playSoundWithName:@"drip"];
            
            [self createShardsWithLocation:p];
            
            UIView * collidedBlock = (UIView *)item;

            [self.gravity removeItem:collidedBlock];
            [self.collision removeItem:collidedBlock];
            
            [collidedBlock removeFromSuperview];
        }
    
    
    else  if ([behavior isEqual:self.shardCollision])
    {
        UIView * collidedShard = (UIView *)item;

        [self.gravity removeItem:collidedShard];
        [self.shardBehavior removeItem:collidedShard];
        [self.shardCollision removeItem:collidedShard];
        
        [collidedShard removeFromSuperview];
    }


    
    
    
}

-(void)createShardsWithLocation:(CGPoint)location
{
    for (NSValue * pointValue in splatterDirections)
    {
     
        CGPoint direction = [pointValue CGPointValue];
        
        UIView * shard = [[UIView alloc] initWithFrame:CGRectMake(location.x + (direction.x *200), location.y -50, 5, 5)];
        
        
        shard.backgroundColor = [UIColor greenColor];
 
        [self.view addSubview:shard];

        [self.gravity addItem:shard];
    
        
        [self.shardBehavior addItem:shard];
        [self.shardCollision addItem:shard];
        
        
        
        
        

//        [self.collision addItem:shard];

        UIPushBehavior * pusher = [[UIPushBehavior alloc] initWithItems:@[shard] mode:UIPushBehaviorModeInstantaneous];
        
//        [pusher addItem:shard];
        
        [self.animator addBehavior:pusher];
        
        pusher.pushDirection = CGVectorMake(direction.x, direction.y);
        
        
    }


}




@end
