//
//  DPAPondViewController.m
//  DigitalPond
//
//  Created by Jeffery Moulds on 5/14/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "DPAPondViewController.h"
#import "DPARipple.h"


@interface DPAPondViewController ()
{

    NSArray * colors;
    NSMutableArray * backgrounds;
    int currentBackground;

}
@end

@implementation DPAPondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.multipleTouchEnabled = YES;

        backgrounds = [@[] mutableCopy];
        currentBackground = 0;
        
        
        colors = @[
                             [UIColor colorWithRed:0.349f green:0.894f blue:0.553f alpha:1.0f],
                             [UIColor colorWithRed:0.945f green:0.337f blue:0.149f alpha:1.0f],
                             [UIColor colorWithRed:0.914f green:0.090f blue:0.420f alpha:1.0f],
                             [UIColor colorWithRed:0.255f green:0.075f blue:0.780f alpha:1.0f],
                             [UIColor colorWithRed:0.298f green:0.729f blue:0.867f alpha:1.0f]
                             ];
        
        
        UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        
        [self.view addGestureRecognizer:swipeRight];
        

        UISwipeGestureRecognizer * swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        
        [self.view addGestureRecognizer:swipeLeft];
        
        
    }
    return self;
}


-(void)swipe:(UISwipeGestureRecognizer *)gesture

{

    float w = self.view.frame.size.width;
    float h = self.view.frame.size.height;
    
    NSLog(@"%@", gesture);
    NSLog(@"%d", (int) gesture.direction);

    // right adds one, left subtracts one
    int direction = (gesture.direction == 1) ? 1 : -1;
    
    
    currentBackground += direction;
    if(currentBackground == [colors count]) currentBackground = 0;
    if(currentBackground == -1) currentBackground = (int)[colors count] -1;
    
    UIView * presentingBGView = [[UIView alloc] initWithFrame:CGRectMake((w * -direction), 0, w, h)];
    
    presentingBGView.backgroundColor = colors[currentBackground];
    
//    [self.view addSubview:presentingBGView];
// slides new views under the ripples
    [self.view insertSubview:presentingBGView atIndex:0];
    
    [backgrounds addObject:presentingBGView];
    
    
    for (UIView * view in backgrounds)
    {
        [UIView animateWithDuration:1.0 animations:^{
            
            view.frame = CGRectMake(view.frame.origin.x + (w * direction), 0, w, h);
            
        } completion:^(BOOL finished) {
            
            if(index == 0)
            {
                [view removeFromSuperview];
                [backgrounds removeObject:view];
                
            }
            
        }];
    }
    
//    NSLog(NSString *format, ...)
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIView * bgview = [[UIView alloc] initWithFrame:self.view.frame];
//    
//    bgview.backgroundColor = colors[currentBackground];
//    
//    [self.view addSubview:bgview];
    
    
    
//    NSLog(@"hello");
    
//    DPARipple * ripple = [[DPARipple alloc] initWithFrame:CGRectMake(100, 100, 0, 0)];
//
//    ripple.rippleCount = 3;
//    ripple.rippleLifeTime = 2.0;
//    
//    [self.view addSubview:ripple];


}


-(void)viewWillAppear:(BOOL)animated

{

    UIView * bgview = [[UIView alloc] initWithFrame:self.view.frame];
    bgview.backgroundColor = colors[currentBackground];
    [self.view addSubview:bgview];
 
    [backgrounds addObject:bgview];
    
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
        [self createRipplesWithTouches:touches];
    
//    for (UITouch * touch in touches)
//    {
//        CGPoint location = [touch locationInView:self.view];
//        
//        DPARipple * ripple = [[DPARipple alloc] initWithFrame:CGRectMake(location.x, location.y, 0, 0)];
//        
//        ripple.rippleCount = 3;
//        ripple.rippleLifeTime = 2.0;
//        
//        [self.view addSubview:ripple];
//        
//        
//        
//    }

}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self createRipplesWithTouches:touches];
    
}



-(void)createRipplesWithTouches:(NSSet *)touches

{

    NSMutableArray * otherColors = [colors mutableCopy];
    
    [otherColors removeObjectAtIndex:currentBackground];
    
    
    for (UITouch * touch in touches)
    {
        
        int random = arc4random_uniform((int)[otherColors count]);
        

        
        CGPoint location = [touch locationInView:self.view];
        
        DPARipple * ripple = [[DPARipple alloc] initWithFrame:CGRectMake(location.x, location.y, 0, 0)];

        ripple.tintColor = otherColors[random];
        ripple.rippleCount = 3;
        ripple.rippleLifeTime = 1.0;
        
        
        [self.view addSubview:ripple];
    
        
    }

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
