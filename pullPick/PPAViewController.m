//
//  PPAViewController.m
//  pullPick
//
//  Created by Jeffery Moulds on 4/30/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PPAViewController.h"
#import "PPAFilterController.h"
#import "ControlsViewController.h"


@interface PPAViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, PPAFilterControllerDelegate, ControlsViewControllerDelegate>


@property (nonatomic) UIImage * originalImage;


@end

@implementation PPAViewController

{


    UIButton * button;
    
    NSMutableArray * filters;
    NSMutableArray * filterButtons;
    NSArray * filterNames;

    UIImageView * imageView;
    PPAFilterController * filterVC;
    ControlsViewController * controlVC;
}





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
    
    controlVC = [[ControlsViewController alloc] initWithNibName:nil bundle:nil];

    controlVC.delegate = self;
    
    controlVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 140, SCREEN_WIDTH, 100);
    controlVC.view.backgroundColor = [UIColor lightGrayColor];

    [self.view addSubview:controlVC.view];
    

    
    
    filterVC = [[PPAFilterController alloc] initWithNibName:nil bundle:nil];
    
    filterVC.delegate = self;
    
    filterVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
    
    [self.view addSubview:filterVC.view];
    
    
    UIButton * libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    libraryButton.layer.cornerRadius = 15;
    libraryButton.backgroundColor = [UIColor whiteColor];
    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:libraryButton];

    
    
    
    
}

-(void)choosePhoto

{
    UIImagePickerController * photoLibrary = [[UIImagePickerController alloc] init];
    
    photoLibrary.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    photoLibrary.delegate = self;

    photoLibrary.allowsEditing = YES;
    
    [self presentViewController:photoLibrary animated:YES completion:nil];

}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info

{   NSLog(@"%@", info);

    self.originalImage = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];


}



-(void)setOriginalImage:(UIImage *)originalImage

{

    _originalImage = originalImage;

    filterVC.imageToFilter = originalImage;
    imageView.image = originalImage;
    
    NSLog(@"hello");
}





-(void)viewWillLayoutSubviews

{
// all moved to own subclass
    
//    filters = [@{} mutableCopy];
//    filterButtons = [@[] mutableCopy];
//    filterNames = @[
////                  @"CIColorCrossPolynomial",
////                  @"CIColorCube",
////                  @"CIColorCubeWithColorSpace",
//                    @"CIColorInvert",
////                  @"CIColorMap",
//                    @"CIColorMonochrome",
//                    @"CIColorPosterize",
//                    @"CIFalseColor",
////                  @"CIMaskToAlpha",
//                    @"CIMaximumComponent",
//                    @"CIMinimumComponent",
//                    @"CIPhotoEffectChrome",
//                    @"CIPhotoEffectFade",
//                    @"CIPhotoEffectInstant",
//                    @"CIPhotoEffectMono",
//                    @"CIPhotoEffectNoir",
//                    @"CIPhotoEffectProcess",
//                    @"CIPhotoEffectTonal",
//                    @"CIPhotoEffectTransfer",
//                    @"CISepiaTone",
//                    @"CIVignette",
////                  @"CIVignetteEffect"
//                    ];

}


//    wh = self.view.frame.size.height - 20;


-(void)updateCurrentImageWithFilteredImage:(UIImage *)image

{
    
    imageView.image = image;

}


-(void)selectfilter
{

  //  [self.delegate selectFilter];

}


-(void)selecthsb

{

 //   [self.delegate selectHsb];


}

-(void)selectblurr
{

  //  [self.delegate selectBlurr];


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
