//
//  SCGstageVC.m
//  Squares
//
//  Created by Jeffery Moulds on 4/11/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "SCGStageVC.h"

#import "SCGSquare.h"

//#import "SCGCircle.h"


@implementation SCGStageVC

{
    int gameSize;
    
    NSArray * playerColors;
    
    int playerTurn;
    
    NSMutableDictionary * tappedDots;

    NSMutableDictionary * allSquares;

    NSString * topLeftDot;
    NSString * topRightDot;
    NSString * bottomLeftDot;
    NSString * bottomRightDot;
    
    
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        playerColors = @[BLUE_COLOR, ORANGE_COLOR];
        
        playerTurn = 0;
        
        tappedDots = [@{} mutableCopy];
        
        allSquares = [@{} mutableCopy];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gameSize = 4;
    
    float circleWidth = SCREEN_WIDTH / gameSize;
    float squareWidth = circleWidth / 2;
    
    //      loop to count buttons
    //      for (float i = 0.0; i < gameSize * gameSize; i++)
    //
    //    {// This assigns numbers to rows and colums
    //        NSLog(@"i = %f", i);
    //
    //        float decimal = floor((i / gameSize) * 100) / 100;
    //
    //        int row = floor(decimal);
    //        int col = ((decimal) - floorf(decimal)) * gameSize;
    //
    //        NSLog(@"i / gameSize =%f", i / gameSize);
    //
    //        NSLog(@"i : %f --- row : %d --- col : %d",i, row, col);

    
    // creates squares
    for (int sRow = 0; sRow < gameSize -1; sRow++)
    {
        for (int sCol = 0; sCol < gameSize -1; sCol++)
    
        {
            float squareX = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sCol);
            float squareY = ((circleWidth - squareWidth) * 1.5) + (circleWidth * sRow) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
            
            SCGSquare * square = [[SCGSquare alloc] initWithFrame:CGRectMake(squareX -5, squareY-5, squareWidth+20, squareWidth+20)];
            
            square.backgroundColor = [UIColor lightGrayColor];
            square.layer.cornerRadius = 5;
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d", sCol, sRow]; // 0,1, c0r1
            
            allSquares[key] = square;
            
            [self.view addSubview:square];
        }
    
    }
    
    
    // loop to id rows and columns
    for (int row = 0; row < gameSize; row++)
        
    {
        for (int col = 0; col < gameSize; col++)
        {

            float circleX = circleWidth * col;
            float circleY = (circleWidth * row) + ((SCREEN_HEIGHT - SCREEN_WIDTH) / 2);
            
            SCGCircle * circle = [[SCGCircle alloc] initWithFrame:CGRectMake(circleX, circleY, circleWidth, circleWidth)];
            
            circle.position = (CGPoint){col, row};
            
            circle.delegate = self;
            
            NSString * key = [NSString stringWithFormat:@"c%dr%d", col, row]; // 0,1, c0r1
            
            tappedDots[key] =@2;
            
            [self.view addSubview:circle];
        }
    }
}
- (UIColor *)circleTappedWithPosition:(CGPoint)position

{
    // get tappedDots key from position
    NSString * key = [NSString stringWithFormat:@"c%dr%d", (int)position.x, (int)position.y]; // 0,1, c0r1

    
    // set player num to value in tappedDots
    tappedDots[key] = @(playerTurn);
    
    
    //check for square
    [self checkForSquareAroundPosition:position];
    
    UIColor * currentColor = playerColors[playerTurn];
    
    playerTurn = (playerTurn) ? 0 : 1;
    
    return currentColor;
    
}


- (void)checkForSquareAroundPosition:(CGPoint)position
{
    
    int pX = position.x;
    int pY = position.y;
    
    
    // x = col and y = row
    
    BOOL above = (pY > 0);
    BOOL below = (pY < gameSize -1);
    BOOL left = (pX > 0);
    BOOL right = (pX < gameSize -1);
    
    
    if (above && left)
    {
        // check top left quadrant
        
        // position 1,1
        
        // 0,0  0,1  1,0  1,1
        
        for (UIColor * color in playerColors)
        {
            // gives us number of player by checking color

            int player = [playerColors indexOfObject:color];

            // checking -1,-1  0,-1,  -1,0  0,0  boxes
            
            topLeftDot = [NSString stringWithFormat:@"c%dr%d", pX-1, pY-1];
            topRightDot = [NSString stringWithFormat:@"c%dr%d", pX, pY-1];
            bottomLeftDot = [NSString stringWithFormat:@"c%dr%d", pX-1, pY];
            bottomRightDot = [NSString stringWithFormat:@"c%dr%d", pX, pY];
            
            
            
            BOOL topDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[topRightDot]]);
            BOOL bottomDotsSame = ([tappedDots[bottomLeftDot] isEqualToValue:tappedDots[bottomRightDot]]);
            BOOL leftDotsSame = ([tappedDots[topLeftDot] isEqualToValue:tappedDots[bottomLeftDot]]);
            
            if(topDotsSame && bottomDotsSame && leftDotsSame && [tappedDots[topLeftDot] isEqualToValue:@(player)])
                
            {

                
                SCGSquare * currentSquare = allSquares[topLeftDot];
                
                NSLog(@"%@",topLeftDot);
                
                currentSquare.backgroundColor = color;
                
                
                
                
                // player owns square
                
            }
            
        }
        
    }
    
    if (above && right)
    {
        // check top right quadrant

        
        
 
    
    
    }
    
    if (below && left)
        
    {
        // check bottom left quadrant

        
        
        
    
    
    
    
    }
    
    if (below && right)
        
    {
        // check bottom right quadrant
    }
    
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

-(BOOL)prefersStatusBarHidden {return YES;}

@end
