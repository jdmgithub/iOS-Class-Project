//
//  NAVViewController.m
//  NavPracticeApp
//
//  Created by Jeffery Moulds on 5/14/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "NAVViewController.h"
#import "NAVColorsTableViewController.h"

@interface NAVViewController ()

@end




@implementation NAVViewController

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
