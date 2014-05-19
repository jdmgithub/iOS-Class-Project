//
//  STAViewControllerFaces.m
//  STATUS
//
//  Created by Jeffery Moulds on 5/19/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "STAViewControllerFaces.h"
#import "STAViewControllerShare.h"

@interface STAViewControllerFaces ()

{
    UINavigationController * nc;
    UIViewController * shareVC;

}

@end

@implementation STAViewControllerFaces

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

    self.navigationController.navigationBarHidden = NO;

    UIButton * A1 = [[UIButton alloc] initWithFrame:CGRectMake(64, 192, 56, 56)];
    UIImage *smiles_1 = [UIImage imageNamed:@"smilies_1.png"];
    [A1 setImage:smiles_1 forState:UIControlStateNormal];
    [self.view addSubview:A1];
    
    
    UIButton * B1 = [[UIButton alloc] initWithFrame:CGRectMake(128, 192, 56, 56)];
    UIImage *smiles_2 = [UIImage imageNamed:@"smilies_2.png"];
    [B1 setImage:smiles_2 forState:UIControlStateNormal];
    [self.view addSubview:B1];
    
    
    UIButton * C1 = [[UIButton alloc] initWithFrame:CGRectMake(192, 192, 56, 56)];
    UIImage *smiles_3 = [UIImage imageNamed:@"smilies_3.png"];
    [C1 setImage:smiles_3 forState:UIControlStateNormal];
    [self.view addSubview:C1];
    
    // ROW 2
    UIButton * A2 = [[UIButton alloc] initWithFrame:CGRectMake(64, 256, 56, 56)];
    UIImage *smiles_4 = [UIImage imageNamed:@"smilies_4.png"];
    [A2 setImage:smiles_4 forState:UIControlStateNormal];
    [self.view addSubview:A2];
    
    
    UIButton * B2 = [[UIButton alloc] initWithFrame:CGRectMake(128, 256, 56, 56)];
    UIImage *smiles_5 = [UIImage imageNamed:@"smilies_5.png"];
    [B2 setImage:smiles_5 forState:UIControlStateNormal];
    [self.view addSubview:B2];
    
    
    UIButton * C2 = [[UIButton alloc] initWithFrame:CGRectMake(192, 256, 56, 56)];
    UIImage *smiles_6 = [UIImage imageNamed:@"smilies_6.png"];
    [C2 setImage:smiles_6 forState:UIControlStateNormal];
    [self.view addSubview:C2];
    
    // ROW 3
    UIButton * A3 = [[UIButton alloc] initWithFrame:CGRectMake(64, 320, 56, 56)];
    UIImage *smiles_7 = [UIImage imageNamed:@"smilies_7.png"];
    [A3 setImage:smiles_7 forState:UIControlStateNormal];
    [self.view addSubview:A3];
    
    
    UIButton * B3 = [[UIButton alloc] initWithFrame:CGRectMake(128, 320, 56, 56)];
    UIImage *smiles_8 = [UIImage imageNamed:@"smilies_8.png"];
    [B3 setImage:smiles_8 forState:UIControlStateNormal];
    [self.view addSubview:B3];
    
    
    UIButton * C3 = [[UIButton alloc] initWithFrame:CGRectMake(192, 320, 56, 56)];
    UIImage *smiles_9 = [UIImage imageNamed:@"smilies_9.png"];
    [C3 setImage:smiles_9 forState:UIControlStateNormal];
    [self.view addSubview:C3];


    // Arrow
    UIButton * arrowButton = [[UIButton alloc] initWithFrame:CGRectMake(128, 496, 56, 56)];
    UIImage * arrowImage = [UIImage imageNamed:@"arrow.png"];
    [arrowButton setImage:arrowImage forState:UIControlStateNormal];
    [arrowButton addTarget:self action:@selector(launchShareView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowButton];
    

}


-(void)launchShareView
{

    shareVC = [[STAViewControllerShare alloc] initWithNibName:nil bundle:nil];
    nc = [[UINavigationController alloc] initWithRootViewController: shareVC];
    [self.navigationController pushViewController:shareVC animated:NO];
    
    self.navigationController.navigationBarHidden = NO;



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
