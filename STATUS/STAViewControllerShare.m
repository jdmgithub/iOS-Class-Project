//
//  STAViewControllerShare.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STAViewControllerShare.h"

@interface STAViewControllerShare ()

@end

@implementation STAViewControllerShare

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


    UIButton * bigSmile = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH / 2) - 96, (SCREEN_HEIGHT /2) - 96, 192, 192)];
    UIImage * bigSmileImage = [UIImage imageNamed:@"big_smilie.png"];
    [bigSmile setImage:bigSmileImage forState:UIControlStateNormal];
    [self.view addSubview:bigSmile];



    // Check
    UIButton * arrowButton = [[UIButton alloc] initWithFrame:CGRectMake(128, 496, 80, 56)];
    UIImage * arrowImage = [UIImage imageNamed:@"check.png"];
    [arrowButton setImage:arrowImage forState:UIControlStateNormal];
    [arrowButton addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowButton];

}


-(void)share

{


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
