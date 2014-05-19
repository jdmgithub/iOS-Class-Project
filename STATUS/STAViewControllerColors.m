//
//  STAViewControllerColors.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STAViewControllerColors.h"
#import "STAViewControllerFaces.h"

@interface STAViewControllerColors ()


{
    UINavigationController * nc;
    STAViewControllerFaces * facesVC;
    
    UIImage * selectionSquares;
    
    int chosenColorIndex;

//    NSString * buttonTag;
//    int buttonTag;
    
}

@end




@implementation STAViewControllerColors



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

//        self.view.backgroundColor = [UIColor redColor];

        self.navigationController.navigationBarHidden = YES;


        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    // ROW 1
    UIButton * A1 = [[UIButton alloc] initWithFrame:CGRectMake(64, 192, 56, 56)];
    UIImage *color_1 = [UIImage imageNamed:@"colors_1.png"];
    [A1 setImage:color_1 forState:UIControlStateNormal];
    A1.tag = 0;
    [A1 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:A1];
    
    
    UIButton * B1 = [[UIButton alloc] initWithFrame:CGRectMake(128, 192, 56, 56)];
    UIImage *color_2 = [UIImage imageNamed:@"colors_2.png"];
    [B1 setImage:color_2 forState:UIControlStateNormal];
    B1.tag =1;
    [B1 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B1];

    
    UIButton * C1 = [[UIButton alloc] initWithFrame:CGRectMake(192, 192, 56, 56)];
    UIImage *color_3 = [UIImage imageNamed:@"colors_3.png"];
    [C1 setImage:color_3 forState:UIControlStateNormal];
    C1.tag =2;
    [C1 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:C1];
    
    // ROW 2
    UIButton * A2 = [[UIButton alloc] initWithFrame:CGRectMake(64, 256, 56, 56)];
    UIImage *color_4 = [UIImage imageNamed:@"colors_4.png"];
    A2.tag =3;
    [A2 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [A2 setImage:color_4 forState:UIControlStateNormal];
    [self.view addSubview:A2];
    
    
    UIButton * B2 = [[UIButton alloc] initWithFrame:CGRectMake(128, 256, 56, 56)];
    UIImage *color_5 = [UIImage imageNamed:@"colors_5.png"];
    [B2 setImage:color_5 forState:UIControlStateNormal];
    B2.tag =4;
    [B2 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B2];
    
    
    UIButton * C2 = [[UIButton alloc] initWithFrame:CGRectMake(192, 256, 56, 56)];
    UIImage *color_6 = [UIImage imageNamed:@"colors_6.png"];
    [C2 setImage:color_6 forState:UIControlStateNormal];
    C2.tag =5;
    [C2 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:C2];

    // ROW 3
    UIButton * A3 = [[UIButton alloc] initWithFrame:CGRectMake(64, 320, 56, 56)];
    UIImage *color_7 = [UIImage imageNamed:@"colors_7.png"];
    [A3 setImage:color_7 forState:UIControlStateNormal];
    A3.tag =6;
    [A3 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:A3];
    
    
    UIButton * B3 = [[UIButton alloc] initWithFrame:CGRectMake(128, 320, 56, 56)];
    UIImage *color_8 = [UIImage imageNamed:@"colors_8.png"];
    [B3 setImage:color_8 forState:UIControlStateNormal];
    B3.tag =7;
    [B3 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B3];
    
    
    UIButton * C3 = [[UIButton alloc] initWithFrame:CGRectMake(192, 320, 56, 56)];
    UIImage *color_9 = [UIImage imageNamed:@"colors_9.png"];
    C3.tag =8;
    [C3 addTarget:self action:@selector(colorSelection:) forControlEvents:UIControlEventTouchUpInside];
    [C3 setImage:color_9 forState:UIControlStateNormal];
    [self.view addSubview:C3];


    // Arrow
    UIButton * arrowButton = [[UIButton alloc] initWithFrame:CGRectMake(128, 496, 56, 56)];
    UIImage * arrowImage = [UIImage imageNamed:@"arrow.png"];
    [arrowButton setImage:arrowImage forState:UIControlStateNormal];
    [arrowButton addTarget:self action:@selector(launchFacesView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowButton];

}


-(void)colorSelection:(UIButton *)sender

{
    NSLog(@"%d", (int)sender.tag);
    chosenColorIndex = (int)sender.tag;
}





-(void)launchFacesView
{

    facesVC = [[STAViewControllerFaces alloc] initWithNibName:nil bundle:nil];
    
    [facesVC setColorWithIndex:chosenColorIndex];
    
    nc = [[UINavigationController alloc] initWithRootViewController: facesVC];
    [self.navigationController pushViewController:facesVC animated:NO];
    
    self.navigationController.navigationBarHidden = YES;

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
