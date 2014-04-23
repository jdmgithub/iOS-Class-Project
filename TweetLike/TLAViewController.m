//
//  TLAViewController.m
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TLAViewController.h"

@interface TLAViewController ()

{
    UITextView * captionField;


}

@end

@implementation TLAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
// Custom initialization

    
        captionField = [[UITextView alloc] initWithFrame:CGRectMake((320 /2) - 140, 330, 280, 50)];
        captionField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.05];
        captionField.layer.cornerRadius = 6;
    
        captionField.tintColor =[UIColor blackColor];  // changes cursor color
        captionField.keyboardType = UIKeyboardTypeTwitter;
        
        [self.view addSubview:captionField];
    

    
    
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
