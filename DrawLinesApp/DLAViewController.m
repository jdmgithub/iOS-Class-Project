//
//  DLAViewController.m
//  DrawLinesApp
//
//  Created by Jeffery Moulds on 4/15/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "DLAViewController.h"
#import "DLAStage.h"

@interface DLAViewController ()

@end

@implementation DLAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        self.view = [[DLAStage alloc] initWithFrame:self.view.frame];
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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