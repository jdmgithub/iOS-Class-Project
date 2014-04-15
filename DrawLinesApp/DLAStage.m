//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Jeffery Moulds on 4/15/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "DLAStage.h"

@implementation DLAStage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
// reports location of touch in x / y coordianates  -- the initial touch only
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        NSLog(@"Touch X %f, Y %f", location.x, location.y);
    
    }

}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    // reports location of touch in x / y coordianates  -- as it drags only
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        NSLog(@"Touch X %f, Y %f", location.x, location.y);
        
    }

    
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    // reports location of touch in x / y coordianates  -- the removal of the touch only
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        NSLog(@"Touch X %f, Y %f", location.x, location.y);
        
    }

    

}



@end
