//
//  NAVViewController.m
//  NavPracticeApp
//
//  Created by Jeffery Moulds on 5/14/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "NAVLaunchViewController.h"
#import "NAVColorsTableViewController.h"

@interface NAVLaunchViewController ()

{
    
    UINavigationController * nc;
    UITableViewController * colorTVC;
    
    
}



@end



@implementation NAVLaunchViewController
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        float w = self.view.frame.size.width;
        float h = self.view.frame.size.height;
        
        
        self.view.backgroundColor = [UIColor colorWithRed:0.184f green:0.800f blue:0.443f alpha:1.0f];
        
        
        UIButton * launchButton = [[UIButton alloc] initWithFrame:CGRectMake(w/2 -50, h/2 -50, 100, 100)];
        launchButton.backgroundColor = [UIColor colorWithRed:0.945f green:0.337f blue:9.149f alpha:1.0f];
        launchButton.layer.cornerRadius = 50;
        [launchButton setTitle:@"Launch" forState:UIControlStateNormal];
        [launchButton addTarget:self action:@selector(launchTableView) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:launchButton];
        
        
        
        
        
        
    }
    return self;
}

-(void)launchTableView

{
    colorTVC = [[NAVColorsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    nc = [[UINavigationController alloc] initWithRootViewController: colorTVC];
    
    [self presentViewController:nc animated:NO completion:nil];
    
    
    nc.toolbarHidden = NO;
    
    UIBarButtonItem * button1 = [[UIBarButtonItem alloc] initWithTitle:@"Numbers" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem * button2 = [[UIBarButtonItem alloc] initWithTitle:@"Shapes" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIBarButtonItem * flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [nc.toolbar setItems:@[flexible, button1, flexible, button2, flexible] animated:YES];
    
//    [self.view addSubview:nc.view];
    
    
    
    
    
    
    
    
    //STARS AND MOONS!  ADD THE VIEW!!!!
    //    [self.view addSubview:colorTVC.view];
    
    
    
    
    
    //
    //    UINavigationController * navigationBarController = [[UINavigationController alloc] initWithNibName:nil bundle:nil];
    //
    //    [self.view addSubview:navigationBarController.view];
    //
    //
    //
    //    [navigationBarController.view addSubview:colorTVC.view];
    
    
    
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



@end
