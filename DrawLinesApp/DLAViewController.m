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

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

//        self.view = [[DLAStageLines alloc] initWithFrame:self.view.frame];
 
//        self.view = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    scribbleView = [[DLAStageScribble alloc] initWithFrame:self.view.frame];
    
//    scribbleView.lineColor = [UIColor blueColor];
    
    [self.view addSubview:scribbleView];
    

    
    
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 320, 280, 40)];

    [self.view addSubview:slider];
    


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
