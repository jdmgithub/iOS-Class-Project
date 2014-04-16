//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Jeffery Moulds on 4/15/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStageLines.h"
#import "DLAStageScribble.h"

@interface DLAViewController ()

@end

@implementation DLAViewController

{
    DLAStageScribble * scribbleView;
    
    UIView * colorsDrawer;

    float lineWidth;
    UIColor * lineColor;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    lineColor = [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f];
    lineWidth = 5.0;
    
//    scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
    [self toggleStage];

    [self.view addSubview:scribbleView];
    
    
    
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 430, 280, 40)];
    slider.minimumValue = 2.0;
    slider.maximumValue = 20.0;
    slider.value = lineWidth;
    
    [slider addTarget:self action:@selector(changeSize:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    
    colorsDrawer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    NSArray * colors = @[
                         [UIColor colorWithRed:0.251f green:0.251f blue:0.251f alpha:1.0f],
                         [UIColor colorWithRed:0.008f green:0.353f blue:0.431f alpha:1.0f],
                         [UIColor colorWithRed:0.016f green:0.604f blue:0.671f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.988f blue:0.910f alpha:1.0f],
                         [UIColor colorWithRed:1.000f green:0.298f blue:0.153f alpha:1.0f]
                         ];
    
    float buttonWidth = 320 / [colors count];
    for (UIColor * color in colors)
        
    {
        int index = [colors indexOfObject:color];
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * index, 0, buttonWidth, 40)];
        button.backgroundColor = color;
        [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
        
        [colorsDrawer addSubview:button];
        
    }
    
    [self.view addSubview:colorsDrawer];
    
    UISwitch * toggleSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 140, 50, 50)];
//    toggleSwitch.backgroundColor = [UIColor orangeColor];
    [toggleSwitch addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
    toggleSwitch.onTintColor = [UIColor blackColor];
    toggleSwitch.TintColor = [UIColor orangeColor];

    
    [self.view addSubview:toggleSwitch];
    
    
    UIButton   * toggleButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, 50, 50)];
    toggleButton.backgroundColor = [UIColor orangeColor];
    [toggleButton addTarget:self action:@selector(toggleStage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toggleButton];
    
    
    
    UIButton * clearButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 50, 50, 50)];
    clearButton.backgroundColor = [UIColor redColor];
    [clearButton addTarget:self action:@selector(clearStage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:clearButton];
    
    
    
    UIButton * undoButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 50, 50, 50)];
    undoButton.backgroundColor = [UIColor lightGrayColor];
    [undoButton addTarget:self action:@selector(undoStage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:undoButton];
}




-(void)toggleStage

{

    NSMutableArray * lines = scribbleView.lines;
    
    
    
    
    [scribbleView removeFromSuperview];
    
    
    if([scribbleView isMemberOfClass:[DLAStageScribble class]])
    {
        scribbleView = [[DLAStageLines alloc] initWithFrame:self.view.frame];
        
    } else {
        scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    }

    scribbleView.lineWidth = lineWidth;
    scribbleView.lineColor = lineColor;

    if(lines != nil) scribbleView.lines = lines;
    
    [self.view insertSubview:scribbleView atIndex:0];
}



-(void)clearStage

{
    [scribbleView clearStage];
    
}


-(void)undoStage

{
    [scribbleView undo];
}


-(void)changeSize:(UISlider *)sender

{
    scribbleView.lineWidth = lineWidth;
    lineWidth = sender.value;
}


-(void)changeColor:(UIButton *)sender
{
    scribbleView.lineColor = lineColor;
    lineColor = sender.backgroundColor;
}


-(BOOL)prefersStatusBarHidden {return YES;}



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
