//
//  DLAStage.m
//  DrawLinesApp
//
//  Created by Jeffery Moulds on 4/15/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "DLAStageLines.h"

@implementation DLAStageLines

{
    NSMutableArray * lines;

}






- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    
        lines = [@[] mutableCopy];
    
        self.backgroundColor = [UIColor whiteColor];
    
    
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();

//    drawRect redraws itself. If dont set background above, must add this line.  w/o creates odd effect.
//    CGContextClearRect(context, rect);
    
    [[UIColor blackColor] set];
    
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    
    for (NSArray * line in lines)
        
    {
        CGPoint start = [line[0] CGPointValue];
        CGPoint end = [line[1] CGPointValue];

        CGContextMoveToPoint(context, start.x, start.y);
        CGContextAddLineToPoint(context, end.x, end.y);

        CGContextStrokePath(context);
    
    }
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
// reports location of touch in x / y coordianates  -- the initial touch only
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [lines addObject:[@[
                            [NSValue valueWithCGPoint:location],
                            [NSValue valueWithCGPoint:location]
                            
                            ] mutableCopy]];
        
        
        
        
        NSLog(@"Touch X %f, Y %f", location.x, location.y);
    
        
    
    }

    [self setNeedsDisplay];
    
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event

{
    // reports location of touch in x / y coordianates  -- as it drags only
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        NSLog(@"Touch X %f, Y %f", location.x, location.y);
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];
        
    
        
    
    }

    [self setNeedsDisplay];

    
    
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    // reports location of touch in x / y coordianates  -- the removal of the touch only
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        NSLog(@"Touch X %f, Y %f", location.x, location.y);
        
        [lines lastObject][1] = [NSValue valueWithCGPoint:location];

    
    }

    [self setNeedsDisplay];


}



@end
