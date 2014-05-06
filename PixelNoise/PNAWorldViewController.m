//
//  PNAWorldViewController.m
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/5/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PNAWorldViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface PNAWorldViewController () <UICollisionBehaviorDelegate>

@property (nonatomic) AVAudioPlayer * player;

@property (nonatomic) UIDynamicAnimator * animator;

@property (nonatomic) UICollisionBehavior * collisionBehavior;

@property (nonatomic) NSMutableArray * blocks;

@property (nonatomic) UIDynamicItemBehavior *blocksDynamicProperties;

@property (nonatomic) UIPushBehavior * pusher;

@property (nonatomic) UIAttachmentBehavior * attacher;


@end



@implementation PNAWorldViewController

{
    
    UIView * block;
    
    CGPoint point;


}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        
        self.blocks = [@[] mutableCopy];
        

        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    
}



-(void)createBlocks
{
    int x = point.x;
    int y = point.y;
    
    block = [[UIView alloc] initWithFrame: CGRectMake(x, y, 10, 10)];
    block.backgroundColor = [UIColor redColor];

// adds to array named blocks
    [self.view addSubview:block];

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[block]];
//    CGVector vector = CGVectorMake(0, 0);

    [self.animator addBehavior:gravityBehavior];

    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:self.blocks];
    self.collisionBehavior.collisionDelegate = self;
    
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collisionBehavior addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(w, h+10) toPoint:CGPointMake(w, h+10)];
    
    [self.animator addBehavior:self.collisionBehavior];

    
    
    self.blocksDynamicProperties.elasticity = 1.0;
    self.blocksDynamicProperties.density = 1000000;
    self.blocksDynamicProperties.resistance = 0.0;
    self.blocksDynamicProperties.allowsRotation = YES;
    
    [self.animator addBehavior:self.blocksDynamicProperties];

}




-(UIDynamicItemBehavior*)createPropertiesForItems:(NSArray *)blocks;
{

UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:blocks];
properties.allowsRotation = YES;
properties.friction = 0.0;
properties.elasticity = 1.0;
properties.density = 10;
[self.animator addBehavior:properties];
return properties;

}



-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p

{

    [self.collisionBehavior removeItem:block];

}





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{

    UITouch * touch = [touches anyObject];
    point = [touch locationInView:self.view];
    NSLog(@"X Loation: %f", point.x);
    NSLog(@"Y Loation: %f", point.y);

    [self createBlocks];

    [self playSoundWithName:@"short_whoosh"];

    
}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    UITouch * touch = [touches anyObject];
    point = [touch locationInView:self.view];

    NSLog(@"X Loation: %f", point.x);
    NSLog(@"Y Loation: %f", point.y);
    
    [self createBlocks];
    

}


-(void)playSoundWithName:(NSString *)soundName
{
    
    
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    // can do a url to file within the app (eg. a local URL). Do this or with data.
    NSURL * url = [[NSURL alloc] initFileURLWithPath:file];
    
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [self.player play];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
