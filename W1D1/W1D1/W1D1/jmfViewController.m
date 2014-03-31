//
//  jmfViewController.m
//  W1D1
//
//  Created by Jeffery Moulds on 3/31/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "jmfViewController.h"

@interface jmfViewController ()

@end

@implementation jmfViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonOne:(id)sender {
    self.labelOne.text= @"Label One Affect";
}

- (IBAction)buttonTwo:(id)sender {
    self.labelTwo.text= self.textEntry.text;
}

- (IBAction)buttonThree:(id)sender {
    self.labelThree.textColor= [ UIColor redColor];
}

- (IBAction)textEntry:(id)sender {
    
}

@end
