//
//  TLANavController.m
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TLANavController.h"

@interface TLANavController ()

@end

@implementation TLANavController

{

    
}



- (id)initWithRootViewController:(UIViewController *)rootViewController

{

    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
    // custom
        
        self.navigationBar.barTintColor = [UIColor blueColor];
        self.navigationBar.translucent = NO;

        UIButton * addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height -35), 160, 30)];
    
        addNewItem.backgroundColor = [UIColor whiteColor];
        addNewItem.layer.cornerRadius = 15;
        [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
        addNewItem.titleLabel.textColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
        
        [self.navigationBar addSubview:addNewItem];
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
