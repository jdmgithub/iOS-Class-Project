//
//  CARRootViewController.m
//  Car
//
//  Created by Jeffery Moulds on 4/1/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "CARRootViewController.h"
#import "CARWheel.h"
#import "CARBumber.h"
#import "CARWindow.h"
#import "CARIgnition.h"
#import "CARGasPedal.h"
#import "CARBrake.h"


@interface CARRootViewController ()

@end

@implementation CARRootViewController

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
    // Do any additional setup after loading the view.


    CARWheel *wheel1 = [[CARWheel alloc] init];
    wheel1.frame = CGRectMake(20, 40, 40, 40);
    [self.view addSubview:wheel1];
     
    
    CARWheel *wheel2 = [[CARWheel alloc] init];
    wheel2.frame = CGRectMake(265, 40, 40, 40);
    [self.view addSubview:wheel2];
    
    
    CARWheel *wheel3 = [[CARWheel alloc] init];
    wheel3.frame = CGRectMake(20, 420, 40, 40);
    [self.view addSubview:wheel3];
    
    
    CARWheel *wheel4 = [[CARWheel alloc] init];
    wheel4.frame = CGRectMake(265, 420, 40, 40);
    [self.view addSubview:wheel4];
    
    CARGasPedal * gasPedal = [[CARGasPedal alloc] init];
    gasPedal.frame = CGRectMake(220, 300, 80, 100);
    [gasPedal setTitle:@"Go" forState:UIControlStateNormal];
    [gasPedal addTarget:self action:@selector(pressGasPedal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gasPedal];
    
    CARWindow *windshield = [[CARWindow alloc] init];
    windshield.frame = CGRectMake(20, 100, 280, 200);
    windshield.backgroundColor = [UIColor blackColor];
    windshield.alpha = 0.2;
    [self.view addSubview:windshield];
    
    CARBrake * brakePedal = [[CARBrake alloc] init];
    brakePedal.frame = CGRectMake(20, 300, 80, 100);
    [brakePedal setTitle:@"Stop" forState:UIControlStateNormal];
    [brakePedal addTarget:self action:@selector(pressBrake) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:brakePedal];
    
    CARIgnition * ignition = [[CARIgnition alloc] init];
    ignition.frame = CGRectMake(135, 200, 50, 50);
    [ignition setTitle:@"Start" forState:UIControlStateNormal];
    [ignition addTarget:self action:@selector(pressignition) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ignition];
    
    CARBumber *bumper = [[CARBumber alloc] init];
    bumper.frame = CGRectMake(20, 100, 280, 40);
    bumper.backgroundColor = [UIColor brownColor];
    [self.view addSubview:bumper];

    
    
    
}

- (void)pressGasPedal

{
    NSLog(@"pressed gas");

}

- (void)pressBrake

{
    NSLog(@"pressed brake");
}


- (void)pressignition

{
    NSLog(@"vroom vroom");
}


- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];

    
}



@end
