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
    STAViewControllerShare * shareVC;
    
    NSString * imageTitle;
    NSString * titleString;

    UIImageView * selectedFrame;
    
    int chosenFaceIndex;

    
}

@end

@implementation STAViewControllerFaces

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        selectedFrame = [[UIImageView alloc] initWithFrame:CGRectMake(-6, -6, 69, 69)];
        selectedFrame.image = [UIImage imageNamed:@"squares.png"];

        
        
        self.colors = @[@"smilies",@"angry"];
    }
    return self;
}

- (void)setColorWithIndex:(int)index
{
    self.color = self.colors[index];

    
//    NSLog(@"Color String:%@", self.color);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    // tag:equals tag:string
    
    if ([self.color isEqualToString:@"smilies"])
    {
        imageTitle = @"smilies";
    }

    
    
    if ([self.color isEqualToString:@"angry"])
    {
        imageTitle = @"angry";
    }
 
    NSString * baseString = [NSString stringWithFormat:@"%@", imageTitle];
    
    NSString * titleString1 = [baseString stringByAppendingString:@"_1.png"];
    NSString * titleString2 = [baseString stringByAppendingString:@"_2.png"];
    NSString * titleString3 = [baseString stringByAppendingString:@"_3.png"];
    NSString * titleString4 = [baseString stringByAppendingString:@"_4.png"];
    NSString * titleString5 = [baseString stringByAppendingString:@"_5.png"];
    NSString * titleString6 = [baseString stringByAppendingString:@"_6.png"];
    NSString * titleString7 = [baseString stringByAppendingString:@"_7.png"];
    NSString * titleString8 = [baseString stringByAppendingString:@"_8.png"];
    NSString * titleString9 = [baseString stringByAppendingString:@"_9.png"];
    
    
    
    
//    NSLog(@"%@", titleString1);

    
    
//    titleString = [NSString stringWithFormat:@"%@_1.png", imageTitle];
    
//    NSLog(@"%@", titleString);
    
    self.navigationController.navigationBarHidden = NO;

    UIButton * A1 = [[UIButton alloc] initWithFrame:CGRectMake(64, 192, 56, 56)];
    UIImage *smiles_1 = [UIImage imageNamed:titleString1];
    [A1 setImage:smiles_1 forState:UIControlStateNormal];
    A1.tag = 0;
    [A1 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:A1];
    
    
    UIButton * B1 = [[UIButton alloc] initWithFrame:CGRectMake(128, 192, 56, 56)];
    UIImage *smiles_2 = [UIImage imageNamed:titleString2];
    [B1 setImage:smiles_2 forState:UIControlStateNormal];
    B1.tag = 1;
    [B1 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B1];
    
    
    UIButton * C1 = [[UIButton alloc] initWithFrame:CGRectMake(192, 192, 56, 56)];
    UIImage *smiles_3 = [UIImage imageNamed:titleString3];
    [C1 setImage:smiles_3 forState:UIControlStateNormal];
    C1.tag = 2;
    [C1 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:C1];
    
    // ROW 2
    UIButton * A2 = [[UIButton alloc] initWithFrame:CGRectMake(64, 256, 56, 56)];
    UIImage *smiles_4 = [UIImage imageNamed:titleString4];
    [A2 setImage:smiles_4 forState:UIControlStateNormal];
    A2.tag = 3;
    [A2 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:A2];
    
    
    UIButton * B2 = [[UIButton alloc] initWithFrame:CGRectMake(128, 256, 56, 56)];
    UIImage *smiles_5 = [UIImage imageNamed:titleString5];
    [B2 setImage:smiles_5 forState:UIControlStateNormal];
    B2.tag = 4;
    [B2 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B2];
    
    
    UIButton * C2 = [[UIButton alloc] initWithFrame:CGRectMake(192, 256, 56, 56)];
    UIImage *smiles_6 = [UIImage imageNamed:titleString6];
    [C2 setImage:smiles_6 forState:UIControlStateNormal];
    C2.tag = 5;
    [C2 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:C2];
    
    // ROW 3
    UIButton * A3 = [[UIButton alloc] initWithFrame:CGRectMake(64, 320, 56, 56)];
    UIImage *smiles_7 = [UIImage imageNamed:titleString7];
    [A3 setImage:smiles_7 forState:UIControlStateNormal];
    A3.tag = 6;
    [A3 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:A3];
    
    
    UIButton * B3 = [[UIButton alloc] initWithFrame:CGRectMake(128, 320, 56, 56)];
    UIImage *smiles_8 = [UIImage imageNamed:titleString8];
    [B3 setImage:smiles_8 forState:UIControlStateNormal];
    B3.tag = 7;
    [B3 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B3];
    
    
    UIButton * C3 = [[UIButton alloc] initWithFrame:CGRectMake(192, 320, 56, 56)];
    UIImage *smiles_9 = [UIImage imageNamed:titleString9];
    [C3 setImage:smiles_9 forState:UIControlStateNormal];
    C3.tag = 8;
    [C3 addTarget:self action:@selector(faceSelection:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:C3];


    // Arrow
    UIButton * arrowButton = [[UIButton alloc] initWithFrame:CGRectMake(128, 496, 56, 56)];
    UIImage * arrowImage = [UIImage imageNamed:@"arrow.png"];
    [arrowButton setImage:arrowImage forState:UIControlStateNormal];
    [arrowButton addTarget:self action:@selector(launchShareView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:arrowButton];
    

}

-(void)faceSelection:(UIButton *)sender
{

    NSLog(@"Faces: %d", (int)sender.tag);
    chosenFaceIndex = (int)sender.tag;
    [sender insertSubview:selectedFrame atIndex:0];


}


-(void)launchShareView
{
    
    shareVC = [[STAViewControllerShare alloc] initWithNibName:nil bundle:nil];
    
    
    // get the index of self.color in self.colors
    shareVC.colorIndex = (int)[self.colors indexOfObject:self.color];
    
    [shareVC setFaceWithIndex:chosenFaceIndex];
    
    
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
