//
//  PNAWorldViewController.m
//  PixelNoise
//
//  Created by Jeffery Moulds on 5/5/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PNAWorldViewController.h"

@interface PNAWorldViewController () <UICollisionBehaviorDelegate>


@property (nonatomic) UIDynamicAnimator * animator;

@property (nonatomic) UICollisionBehavior * collisionBehavior;

@property (nonatomic) NSMutableArray * blocks;

@property (nonatomic) UIDynamicItemBehavior *blocksDynamicProperties;


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


-(void)createBlocks
{
    int x = point.x;
    int y = point.y;
    
    block = [[UIView alloc] initWithFrame: CGRectMake(x, y, 10, 10)];
    block.backgroundColor = [UIColor redColor];

// adds to array named blocks
    [self.view addSubview:block];

    self.animator = [[UIDynamicAnimator alloc]   initWithReferenceView:self.view];

    
    UIGravityBehavior* gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[block]];
//    CGVector vector = CGVectorMake(0, 0);

    [self.animator addBehavior:gravityBehavior];

    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:self.blocks];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collisionBehavior.collisionDelegate = self;
    
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collisionBehavior addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(w, h+10) toPoint:CGPointMake(w, h+10)];
    
    [self.animator addBehavior:self.collisionBehavior];
    
    self.blocksDynamicProperties.elasticity = 1.0;
    self.blocksDynamicProperties.density = 200000;
    self.blocksDynamicProperties.resistance = 0.0;
    self.blocksDynamicProperties.allowsRotation = YES;
    
    
}

-(UIDynamicItemBehavior*)createPropertiesForItems:(NSArray *)blocks;
{

UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:blocks];
//properties.allowsRotation = YES;
//properties.friction = 0.0;
//properties.elasticity = 1.0;
//properties.density = 10;
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

}



-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    UITouch * touch = [touches anyObject];
    point = [touch locationInView:self.view];

    NSLog(@"X Loation: %f", point.x);
    NSLog(@"Y Loation: %f", point.y);
    
    [self createBlocks];
    

}




- (void)viewDidLoad
{
    [super viewDidLoad];


    
    
    
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
