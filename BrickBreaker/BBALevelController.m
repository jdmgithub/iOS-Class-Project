//
//  BBALevelController.m
//  BrickBreaker
//
//  Created by Jeffery Moulds on 4/17/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "BBALevelController.h"
#import "MOVE.h"


@interface BBALevelController () <UICollisionBehaviorDelegate>

@property (nonatomic) UIView * paddle;
@property (nonatomic) NSMutableArray * balls;
@property (nonatomic) NSMutableArray * bricks;

//dynamic animator of object - how balls move, pushes, collisions, etc.  He talks to controller
@property (nonatomic) UIDynamicAnimator * animator;

// starts the initial ball movement
@property (nonatomic) UIPushBehavior * pusher;

// handles collisions;  collider registers the collision, the animatior notifies controller?
@property (nonatomic) UICollisionBehavior * collider;

// item behavior properties
@property (nonatomic) UIDynamicItemBehavior * paddleDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * ballsDynamicProperties;
@property (nonatomic) UIDynamicItemBehavior * bricksDynamicProperties;

// itme attachment
@property (nonatomic) UIAttachmentBehavior * attacher;



/////////////////////////
/////////////////////////
/////////////////////////

@end

@implementation BBALevelController

{
    float paddleWidth;
    int points;

}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        self.bricks = [@[] mutableCopy];
        self.balls = [@[] mutableCopy];

        paddleWidth = 80;
        points = 0;
        
        self.view.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1.0];
  
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen:)];
        [self.view addGestureRecognizer:tap];
        
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)resetLevel     //had to paste in the .h so the BBAViewController can see it?
{
    self.animator = [[UIDynamicAnimator alloc]   initWithReferenceView:self.view];

    [self createPaddle];
    [self createBall];
    [self createBricks];

    self.collider = [[UICollisionBehavior alloc] initWithItems:[self allItems]];
    
    self.collider.collisionDelegate = self;

    self.collider.collisionMode = UICollisionBehaviorModeEverything;

// everything collides... cant lose
//    self.collider.translatesReferenceBoundsIntoBoundary = YES;
    
// collides on certain walls only by setting new boundary
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    [self.collider addBoundaryWithIdentifier:@"ceiling" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(w, 0)];
    [self.collider addBoundaryWithIdentifier:@"leftwall" fromPoint:CGPointMake(0, 0) toPoint:CGPointMake(0, h)];
    [self.collider addBoundaryWithIdentifier:@"rightwall" fromPoint:CGPointMake(w, 0) toPoint:CGPointMake(w, h)];
    [self.collider addBoundaryWithIdentifier:@"floor" fromPoint:CGPointMake(0, h + 10) toPoint:CGPointMake(w, h +10)];

    
    
    [self.animator addBehavior:self.collider];

    /////////////////////
    
    self.ballsDynamicProperties = [self createPropertiesForItems:self.balls];
    self.bricksDynamicProperties = [self createPropertiesForItems:self.bricks];
    self.paddleDynamicProperties = [self createPropertiesForItems:@[self.paddle]];
    
    self.paddleDynamicProperties.density = 1000000;
    self.bricksDynamicProperties.density = 1000000;

    self.ballsDynamicProperties.elasticity = 1.0;
    self.ballsDynamicProperties.resistance = 0.0;
    
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item1 withItem:(id<UIDynamicItem>)item2 atPoint:(CGPoint)p
{
    UIView * tempBrick;
    
    for (UIView * brick in self.bricks)
    {
        if ([item1 isEqual:brick] || [item2 isEqual:brick])
        {
        
            if (brick.alpha == .5)
            {
                tempBrick = brick;
                [brick removeFromSuperview];
                [self.collider removeItem:brick];
                
                points += brick.tag;
                
                NSLog(@"Total Points = %d", points);

                [self pointLabelWithBrick:brick];
                [self.delegate addPoints:(int)points];
 
            }
            brick.alpha = 0.5;
        }
    }
    
    if (tempBrick != nil) [self.bricks removeObjectIdenticalTo:tempBrick];
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p

{

    if ([(NSString *)identifier isEqualToString:@"floor"])
    {
        UIView * ball = (UIView *)item;
        
        NSLog(@"Start Over");
        [ball removeFromSuperview];
        [self.collider removeItem:ball];
        
        if (
            [self.delegate respondsToSelector:@selector(gameDone)]
            )
            [self.delegate gameDone];
    }
}



-(void)pointLabelWithBrick:(UIView *)brick

{

    UILabel * label = [[UILabel alloc] initWithFrame:brick.frame];
    
    label.text = [NSString stringWithFormat:@"+%d", (int)brick.tag];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"helveticaNeue" size:12];
    
    [self.view addSubview:label];

    [MOVE animateView:label properties:@{@"alpha":@0,@"duration":@0.5,@"remove":@YES}];


}



-(UIDynamicItemBehavior *)createPropertiesForItems:(NSArray *)items

{
    UIDynamicItemBehavior * properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties = [[UIDynamicItemBehavior alloc] initWithItems:items];
    properties.allowsRotation = NO;
    properties.friction = 0.0;
    
    [self.animator addBehavior:properties];
    return properties;
    
}



-(NSArray *)allItems
{
    NSMutableArray * items = [@[self.paddle] mutableCopy];
    
    for (UIView * item in self.balls) [items addObject:item];
    for (UIView * item in self.bricks) [items addObject:item];

    return items;
    
}


-(void)createPaddle
{

    self.paddle = [[UIView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - paddleWidth) / 2, 260, paddleWidth, 6)];
    
    self.paddle.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];

    self.paddle.layer.cornerRadius = 3;
    
    [self.view addSubview:self.paddle];
    
    self.attacher = [[UIAttachmentBehavior alloc] initWithItem:self.paddle attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame), CGRectGetMidY(self.paddle.frame))];
    
    [self.animator addBehavior:self.attacher];
    
//    [self createPaddleImage];

}

//-(void)createPaddleImage
//
//{
//
//    // Image on Paddle - Does Not Move
//    UIImageView * paddleImage = [[UIImageView alloc] initWithFrame:self.paddle.frame];
//    paddleImage.image = [UIImage imageNamed:@"bookPaddle"];
//    
//    self.attacher = [[UIAttachmentBehavior alloc] initWithItem:paddleImage attachedToAnchor:CGPointMake(CGRectGetMidX(self.paddle.frame), CGRectGetMidY(self.paddle.frame))];
//
//    [self.animator addBehavior:self.attacher];
//    
//    [self.view addSubview:paddleImage];
//}




-(void)createBricks
{

    int brickCols = 10;
    int brickRows = 4;
    
    float brickWidth = (SCREEN_WIDTH - (10 * (brickCols +1))) / brickCols;
    float brickHeight = 20;
    
    for (int c = 0; c < brickCols; c++)
    {
        for (int r = 0; r < brickRows; r++)
        {
            float brickX = ((brickWidth + 10) * c) +10;
            float brickY = ((brickHeight + 10) * r) +10;
        
        UIView * brick = [[UIView alloc] initWithFrame:CGRectMake(brickX, brickY, brickWidth, brickHeight)];
        
        brick.layer.cornerRadius = 6;
        brick.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        
        int random = (arc4random_uniform(5) * 50) + 50;
        brick.tag = random;
                         
        [self.view addSubview:brick];
        [self.bricks addObject:brick];
  

            
// Images on Bricks - They dont Alpha
//            UIImageView * brickImage = [[UIImageView alloc] initWithFrame:brick.frame];
//            brickImage.image = [UIImage imageNamed:@"bookBlocks"];
//            [self.view addSubview:brickImage];
        
        }
    }
}


-(void)createBall
{
 
//      multiple balls
    
    int multiBalls = 1;
    
    for (int x = 0; x < multiBalls; x++)
    {
        
    
    
    CGRect frame = self.paddle.frame;
    
    UIView * ball = [[UIView alloc] initWithFrame: CGRectMake(frame.origin.x, frame.origin.y - 30, 10, 10)];
                     
//    UIImageView * ball = [[UIView alloc] initWithFrame: CGRectMake(frame.origin.x, frame.origin.y - 12, 10, 10)];
//    
//    ball.image = [UIImageView ...... ]
    
    
    ball.backgroundColor = [UIColor whiteColor];
    ball.layer.cornerRadius = 5;
    
    [self.view addSubview:ball];

    //add ball to balls array
    [self.balls addObject:ball];

    }
    
    
    // Start Ball Off with a Push
    self.pusher = [[UIPushBehavior alloc] initWithItems:self.balls mode:UIPushBehaviorModeInstantaneous];
    
    self.pusher.pushDirection = CGVectorMake(0.01, 0.01);
    
    self.pusher.active = YES;
    
    [self.animator addBehavior:self.pusher];

    
}


-(void)tapScreen: (UIGestureRecognizer *)gr
{
    CGPoint location = [gr locationInView:self.view];

    self.attacher.anchorPoint = CGPointMake(location.x, self.attacher.anchorPoint.y);
    
    
    
}



@end
