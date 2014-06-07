//
//  TIYBookingController.m
//  TIYTravel
//
//  Created by Jeffery Moulds on 6/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TIYBookingController.h"

@interface TIYBookingController ()

@end

@implementation TIYBookingController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor lightGrayColor];

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage * image = [UIImage imageNamed:@"bookingScreen"];

    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    
    imageView.frame = CGRectMake(40,40, SCREEN_WIDTH - 40, SCREEN_HEIGHT * .4);
    
    [self.view addSubview:imageView]; 

    
    
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
