//
//  PPAViewController.m
//  pullPick
//
//  Created by Jeffery Moulds on 4/30/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PPAViewController.h"

@interface PPAViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

{

    UIImageView * imageView;
    UIButton * button;
}


@end

@implementation PPAViewController






- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];

    // adjusts the view once cropped if enabled editing below.  Various content modes to use
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:imageView];
    
    
    UIView * navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    navBar.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
    
    [self.view addSubview:navBar];
    
    
    UIButton * libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    
    libraryButton.layer.cornerRadius = 15;
    libraryButton.backgroundColor = [UIColor whiteColor];
    
    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [navBar addSubview:libraryButton];
    
    
    
    UIScrollView * imageScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100)];
    
    imageScroller.pagingEnabled = YES;
    [imageScroller setAlwaysBounceVertical:NO];
    imageScroller.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.8];
    
    NSInteger numberofViews = 20;
    
    for (int i = 0; i < numberofViews; i++) {

        button = [[UIButton alloc] initWithFrame:CGRectMake((i*90), 10, 80, 80)]; // X adds pad each alloc/init
        button.backgroundColor = [UIColor whiteColor];
        [imageScroller addSubview:button];
    }
    
    imageScroller.contentSize = CGSizeMake((button.frame.size.width) * numberofViews, 100);

    [self.view addSubview:imageScroller];

    
    
    UIView * viewAboveScroller = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 140, SCREEN_WIDTH, 40)];
    
    viewAboveScroller.backgroundColor = [UIColor lightGrayColor];
//transparnecy?
  
    [self.view addSubview:viewAboveScroller];
    
    
}

-(void)choosePhoto

{
    UIImagePickerController * photoLibrary = [[UIImagePickerController alloc] init];
    
    photoLibrary.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    photoLibrary.delegate = self;

//    photoLibrary.allowsEditing = YES;
    
    [self presentViewController:photoLibrary animated:YES completion:nil];

}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{   NSLog(@"%@", info);

    imageView.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];


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

 -(BOOL) prefersStatusBarHidden
{
    return YES;

}

@end
