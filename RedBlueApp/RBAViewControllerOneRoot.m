//
//  RBAViewControllerOneRoot.m
//  RedBlueApp
//
//  Created by Jeffery Moulds on 5/7/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "RBAViewControllerOneRoot.h"
#import "RBAViewControllerTwoRed.h"
#import "RBAViewControllerThreeBlue.h"

@interface RBAViewControllerOneRoot ()

{
    RBAViewControllerTwoRed * secondVC;
    RBAViewControllerThreeBlue * thirdVC;

}

@end

@implementation RBAViewControllerOneRoot

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        secondVC = [[RBAViewControllerTwoRed alloc] initWithNibName:nil bundle:nil];
        
        int halfHeight = self.view.frame.size.height /2;
        int halfWidth = self.view.frame.size.height;
        
        secondVC.view.frame = CGRectMake(0, 0, halfWidth, halfHeight);
        secondVC.view.backgroundColor = [UIColor redColor];
        
        

        thirdVC = [[RBAViewControllerThreeBlue alloc] initWithNibName:nil bundle:nil];

        thirdVC.view.frame = CGRectMake(0, halfHeight, halfWidth, halfHeight);
        thirdVC.view.backgroundColor = [UIColor blueColor];

        [self.view addSubview:secondVC.view];
        [self.view addSubview:thirdVC.view];
        
    }
    return self;
}



//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    
//    for (UITouch * touch in touches)
//    {
// 
//        NSLog(@"Touch");
// 
//    }
//    
//}


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
