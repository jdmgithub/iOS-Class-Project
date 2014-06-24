//
//  DLAStageScribble.m
//  DrawLinesApp
//
//  Created by Jeffery Moulds on 4/15/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "DLAStageScribble.h"

@implementation DLAStageScribble

{
// declares the dictionary


//    UIButton * redButton;
//    UIButton * yellowButton;
//    UIButton * blueButton;
//    UISlider * widthslider;
    
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.lineWidth = 2.0;
        self.lineColor = [UIColor colorWithWhite:0.3 alpha:1.0];

        self.backgroundColor = [UIColor whiteColor];
        
        
// allocs and inits the dictionary
        
        self.lines = [@[] mutableCopy];
        
//        // Color Buttons
//        redButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 380, 80, 80)];
//        [redButton setTitle:@"Red Line" forState:UIControlStateNormal];
//        redButton.titleLabel.font = [UIFont systemFontOfSize:14];
//        redButton.backgroundColor = [UIColor redColor];
//        redButton.layer.cornerRadius = 30;
//
////        redButton.tag = 0;
//        
//        [redButton addTarget:self action:@selector(changeLineColor:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self addSubview:redButton];
//    
//        yellowButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 380, 80, 80)];
//        [yellowButton setTitle:@"Yellow Line" forState:UIControlStateNormal];
//        yellowButton.titleLabel.font = [UIFont systemFontOfSize:14];
//        yellowButton.backgroundColor = [UIColor yellowColor];
//        yellowButton.layer.cornerRadius = 30;
//
////        yellowButton.tag = 1;
//        
//        [yellowButton addTarget:self action:@selector(changeLineColor:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self addSubview:yellowButton];
//
//        blueButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 380, 80, 80)];
//        [blueButton setTitle:@"Blue Line" forState:UIControlStateNormal];
//        blueButton.titleLabel.font = [UIFont systemFontOfSize:14];
//        blueButton.backgroundColor = [UIColor blueColor];
//        blueButton.layer.cornerRadius = 30;
////        blueButton.tintColor = [UIColor blackColor];
//
////        blueButton.tag = 2;
//        
//        [blueButton addTarget:self action:@selector(changeLineColor:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self addSubview:blueButton];
//    
////        widthslider = [[UISlider alloc] initWithFrame:CGRectMake(20, 320, 280, 40)];
//////        [widthslider setTitle:@"Width Selector" forState:UIControlStateNormal];
////        widthslider.backgroundColor = [UIColor greenColor];
////        widthslider.layer.cornerRadius = 5;
////    
////        [self addSubview:widthslider];
    
    }
    return self;
}

-(void)clearStage
{

    [self.lines removeAllObjects];
    
    [self setNeedsDisplay];
}

-(void)undo

{
    [self.lines removeLastObject];

    [self setNeedsDisplay];

}



- (void) setWidth

{

    
    
}


// Use self.lines or Lines and:
// 1.  Add Properties to UIView (integer value = line width, integer value = line color)

// 2.  add subview a UI Slider and 3 UI buttons (square with red, yellow, blue).  Slider changes width, buttons change line color property on UI View)

// @ property in .h of scibbles or lines that can be updated outside self

// overwrite setters(a method to overwrite the property) inside of uiview subclass.  Run a "self set needs display" after color and line width changes.  Inside draw rect, need to change our color and width designations.


- (void) changeLineColor:(UIButton *) sender

{
    
    [self setLineColor:sender.backgroundColor];
    
}


- (void) setLineColor:(UIColor *)lineColor

{

    _lineColor = lineColor;
    
     [self setNeedsDisplay];
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    

// Adds and fills Rectangle  ODD - CLEARS CURRENT PATH
//    CGContextFillRect(context, CGRectMake(140, 200, 50, 100));

    
// Adds a Curve
//    CGContextMoveToPoint(context, 50, 50);
//    CGContextAddCurveToPoint(context, 270, 50, 270, 400, 50, 400);

// Adds an Ellipses
//    CGContextAddEllipseInRect(context, CGRectMake(80, 100, 50, 70));

// Adds Rectangle
//    CGContextAddRect(context, CGRectMake(100, 100, 70, 140));
    
//  ???
//    CGContextAddRects(context, <#const CGRect *rects#>, <#size_t count#>);


// Why do Fills over write and erase shapes above, but not filled rectangle?
    
    
// adds and fills Rectangle with color    ODD - CLEARS CURRENT PATH
//        CGContextSetRGBFillColor(context, 0.100f, 0.705f, 0.300f, 1.0);
//
//        CGContextFillRect(context, CGRectMake(100, 200, 50, 100));
    
    CGContextStrokePath(context);

    
    
    
    
    
    
    CGContextSetLineWidth(context, self.lineWidth);
    [self.lineColor set];

//    CGContextClearRect(context, rect);
    
    [self.lineColor set];

    for (NSDictionary * line in self.lines)
    {
        CGContextSetLineWidth(context, [line[@"width"] floatValue]);
        [(UIColor *)line[@"color"] set];

        NSArray * points = line[@"points"];
        
        
        CGPoint start = [points[0] CGPointValue];
        
        CGContextMoveToPoint(context, start.x, start.y);
        
        for (NSValue * value in points)
        {
    
//            int index = [scribble indexOfObject:value];
            
            CGPoint point = [value CGPointValue];

//            if (index > 0)
                CGContextAddLineToPoint(context, point.x, point.y);

    
        }
        CGContextStrokePath(context);
    
    }
}


- (void)setLineWidth:(float)lineWidth

{

    _lineWidth = lineWidth;
    
    [self setNeedsDisplay];

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:self];
        
        [self.lines addObject:[@{
                                @"color" : self.lineColor,
                                @"width" : @(self.lineWidth),
                                @"points" : [@[[NSValue valueWithCGPoint:location]]mutableCopy]
                                } mutableCopy]];
    }
    
    [self setNeedsDisplay];
    
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{

    [self doTouch:touches];

}


    - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event

{
    [self doTouch:touches];


}


-(void)doTouch:(NSSet *)touches
{
    
    UITouch * touch = [touches allObjects][0];
    CGPoint location = [touch locationInView:self];
    
    [[self.lines lastObject][@"points"] addObject:[NSValue valueWithCGPoint:location]];
    
    [self setNeedsDisplay];
    
    
}


@end
