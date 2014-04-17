//
//  BBAViewController.m
//  BrickBreaker
//
//  Created by Jeffery Moulds on 4/17/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "BBAViewController.h"
#import "BBALevelController.h"

@interface BBAViewController ()

{
    BBALevelController * level;
    UIButton * startButton;
}

@end

@implementation BBAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        level = [[BBALevelController alloc] initWithNibName:nil bundle:nil];
        
        [self.view addSubview:level.view];

        
        startButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.75, SCREEN_HEIGHT / 3.5, 160, 160)];
        [startButton setTitle:@"Start" forState:UIControlStateNormal];
        startButton.titleLabel.font = [UIFont systemFontOfSize:40];
        startButton.backgroundColor = [UIColor darkGrayColor];
        startButton.layer.cornerRadius = 80;
        
        [self.view addSubview:startButton];

        [startButton addTarget:self action:@selector(runResetLevel) forControlEvents:UIControlEventTouchUpInside];

        

        
    }
    return self;
}


-(void)runResetLevel

{

    [startButton removeFromSuperview];
    [level resetLevel];

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
