//
//  SABGameScene.m
//  Stuffed Animal Battle
//
//  Created by Jeffery Moulds on 5/15/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "SABGameScene.h"

@interface SABGameScene () <SKPhysicsContactDelegate>


@end


@implementation SABGameScene


{
    
    SKLabelNode * timerLabel;
    SKSpriteNode * player1HPBar;
    SKSpriteNode * player2HPBar;
    
    SKSpriteNode * buttonA;
    SKSpriteNode * buttonB;
    
    SKSpriteNode * dpadUP;
    SKSpriteNode * dpadDown;
    SKSpriteNode * dpadLeft;
    SKSpriteNode * dpadRight;
    
    SKSpriteNode * player1;
    SKSpriteNode * player2;
    
}


-(instancetype)initWithSize:(CGSize)size

{
    self= [super initWithSize:size];
    if (self)
    {
        
        SKPhysicsBody * scenePhysics = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(0, 0, size.width, size.height)];
        self.physicsBody = scenePhysics;
        
        self.physicsWorld.contactDelegate = self;
        
        SKSpriteNode * floor = [SKSpriteNode spriteNodeWithColor:[SKColor yellowColor] size:CGSizeMake(SCREEN_WIDTH, 30)];
        floor.position = CGPointMake(SCREEN_WIDTH / 2.0, 15);
        [self addChild:floor];
        
        
        timerLabel = [SKLabelNode node];
        timerLabel.Position = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT -30);
        timerLabel.text = @"00:00";
        timerLabel.fontColor = [SKColor greenColor];
        timerLabel.fontSize = 16.0;
        
        [self addChild:timerLabel];
        
        
        
        float barArea = ((SCREEN_WIDTH - 60) / 2.0) - 20;
        
        player1HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
        player1HPBar.position = CGPointMake((barArea + 20)/ 2.0, SCREEN_HEIGHT - 20.0);
        [self addChild:player1HPBar];
        
        SKPhysicsBody * floorPhysics = [SKPhysicsBody bodyWithRectangleOfSize:floor.size];
        floorPhysics.affectedByGravity = NO;
        floorPhysics.dynamic = NO;
        floor.physicsBody = floorPhysics;
        
        
        
        player2HPBar = [SKSpriteNode spriteNodeWithColor:[SKColor lightGrayColor] size:CGSizeMake(barArea, 20)];
        player2HPBar.position = CGPointMake(SCREEN_WIDTH - (barArea + 20)/ 2.0, SCREEN_HEIGHT - 20.0);
        
        [self addChild:player2HPBar];
        
        
        
        buttonA = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonA.position = CGPointMake(SCREEN_WIDTH - 40, 80);
        
        [self addChild:buttonA];
        
        
        buttonB = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(40, 40)];
        buttonB.position = CGPointMake(SCREEN_WIDTH - 80, 40);
        
        [self addChild:buttonB];
        
        
        dpadDown = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadDown.position = CGPointMake(80, 40);
        [self addChild:dpadDown];
        
        
        dpadUP = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadUP.position = CGPointMake(80, 120);
        [self addChild:dpadUP];
        
        
        
        dpadLeft = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadLeft.position = CGPointMake(40, 80);
        [self addChild:dpadLeft];
        
        
        
        dpadRight = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size:CGSizeMake(30, 30)];
        dpadRight.position = CGPointMake(120, 80);
        [self addChild:dpadRight];
        
        
//       player1 = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size:CGSizeMake(40, 100)];
//      adding image instead
        player1 = [SKSpriteNode spriteNodeWithImageNamed:@"seahorseRight"];
        player1.size = CGSizeMake(100, 100);
        player1.position = CGPointMake(SCREEN_WIDTH /2 * .6, 80);
        [self addChild:player1];
        
        // adding gravit/physics to player1
        SKPhysicsBody * playerPhysics = [SKPhysicsBody bodyWithRectangleOfSize:player1.size];
        player1.physicsBody = playerPhysics;
        
        
//        player2 = [SKSpriteNode spriteNodeWithColor:[SKColor magentaColor] size:CGSizeMake(40, 100)];
        player2 = [SKSpriteNode spriteNodeWithImageNamed:@"fishLeft"];
        player2.size = CGSizeMake(100, 100);
        player2.position = CGPointMake(SCREEN_WIDTH /2 * 1.5, 80);
        SKPhysicsBody * player2Physics = [SKPhysicsBody bodyWithRectangleOfSize:player2.size];
        player2.physicsBody = player2Physics;
        player2.userData = [@{@"type":@"Player 2"} mutableCopy];
        player2.physicsBody.contactTestBitMask = 2;
        [self addChild:player2];
        
    }
    return self;
}

-(void)update:(NSTimeInterval)currentTime

{
    //    NSLog(@"%d", currentTime);
    
    
    
    
}


-(void)didBeginContact:(SKPhysicsContact *)contact

{
    NSLog(@"%@", contact.bodyA.node.userData[@"type"]);
    NSLog(@"%@", contact.bodyB.node.userData[@"type"]);
    
    
    NSMutableArray * nodes = [@[] mutableCopy];
    
    if(contact.bodyA.node != nil) [nodes addObject:contact.bodyA.node];
    if(contact.bodyB.node != nil) [nodes addObject:contact.bodyB.node];
    
    //    = @[contact.bodyA.node,contact.bodyB.node];
    // check nodes for nil
    
    for (SKNode * node in nodes)
    {
        if ([node.userData[@"type"]
             isEqualToString:@"fireball"])
        {
            [node removeFromParent];
            
            NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"Explosion" ofType:@"sks"];
            
            SKEmitterNode * explosion = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
            
            explosion.position = contact.contactPoint;
            
            explosion.numParticlesToEmit = 400;
            
            [self addChild:explosion];
            
            
        }
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    UITouch * touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
    [self testButtonsWithLocation:location];
    
    
    //    NSLog(@"%f, %f", location.x, location.y);
    //// %u a bool test
    //    NSLog(@"%u", [buttonA containsPoint:location]);
    
}

-(void)testButtonsWithLocation:(CGPoint)location
{
    NSArray * buttons = @[buttonA, buttonB, dpadUP, dpadDown, dpadLeft, dpadRight];
    
    for (SKNode * button in buttons)
    {
        
        if ([button containsPoint:location])
        {
            switch ([buttons indexOfObject:button])
            {
                case 0:  // buttonA
                {    NSLog(@"Fire");
                    
                    NSString * myParticlePath = [[NSBundle mainBundle] pathForResource:@"FireBall" ofType:@"sks"];
                    SKEmitterNode * fireball = [NSKeyedUnarchiver unarchiveObjectWithFile:myParticlePath];
                    fireball.position = CGPointMake(player1.position.x + 57, player1.position.y);
                    SKPhysicsBody * fireballPhysics = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 10)];
                    fireballPhysics.affectedByGravity = NO;
                    fireball.physicsBody = fireballPhysics;
                    fireball.physicsBody.contactTestBitMask = 1;
                    fireball.userData = [@{@"type":@"fireball"} mutableCopy];
                    [self addChild:fireball];
                    [fireballPhysics applyImpulse:CGVectorMake(5.0, 0.0)];
                    
                    break;
                }
                case 1:  // buttonB
                {
                    NSLog(@"Kick");
                }
                    break;
                    
                case 2:
                {
                    
                    NSLog(@"Jump Up");
                    
                    [player1.physicsBody applyImpulse:CGVectorMake(0.0, 250.0)];
                    
                    //                SKAction * jump = [SKAction moveToX:player1.position.x duration:0.1];
                    //
                    //                [player1 runAction:jump];
                    
                    
                    
                }
                    break;
                    
                case 3:
                {
                    
                    NSLog(@"Move Down");
                }
                    break;
                    
                case 4:
                {
                    NSLog(@"Move Left");
                    
                    player1 = [SKSpriteNode spriteNodeWithImageNamed:nil];

                    player1 = [SKSpriteNode spriteNodeWithImageNamed:@"seahorseLeft"];
                    
                    
                    [player1.physicsBody applyImpulse:CGVectorMake(-50.0, 0.0)];
                    
                }
                    break;
                    
                case 5:
                {
                    NSLog(@"Move Right");
                    
                    [player1.physicsBody applyImpulse:CGVectorMake(50.0, 0.0)];
                    
                    
                    //                SKAction * moveRight = [SKAction moveToX:player1.position.x +5 duration:0.1];
                    
                    //                [player1 runAction:moveRight];
                }
                    break;
                    
                    
                default:
                    break;
            }
        }
        
    }
    
}




@end
