//
//  PPAFilterController.m
//  pullPick
//
//  Created by Jeffery Moulds on 5/1/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "PPAFilterController.h"

@interface PPAFilterController ()

@property (nonatomic) NSString * currentFilter;

@end

@implementation PPAFilterController



{
    
    UIScrollView * scrollView;
    NSArray * filterNames;
    NSMutableArray * filterButtons;
    
    
    UIButton * button;
    
    NSMutableArray * filters;
    
    float wh;
//    NSMutableArray * filterButtons;
//    NSArray * filterNames;

  
    

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    
        self.view.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        
        
//        filters = [@{} mutableCopy];
        filterButtons = [@[] mutableCopy];
        filterNames = @[
                        @"CIColorInvert",
                        @"CIColorMonochrome",
                        @"CIColorPosterize",
                        @"CIFalseColor",
                        @"CIMaximumComponent",
                        @"CIMinimumComponent",
                        @"CIPhotoEffectChrome",
                        @"CIPhotoEffectFade",
                        @"CIPhotoEffectInstant",
                        @"CIPhotoEffectMono",
                        @"CIPhotoEffectNoir",
                        @"CIPhotoEffectProcess",
                        @"CIPhotoEffectTonal",
                        @"CIPhotoEffectTransfer",
                        @"CISepiaTone",
                        @"CIVignette",
                        ];

    
        scrollView = [[UIScrollView alloc] init];
        [self.view addSubview:scrollView];
    
    
    
    }
    return self;
}

- (void)viewWillLayoutSubviews
{
    // Do any additional setup after loading the view.
    
 
 
    wh = self.view.frame.size.height - 20;

    NSLog(@"create button");
    
    
    int numButtons = (int) [scrollView.subviews count];
    NSLog(@"currently scrollview has %d buttons", numButtons);
//    if (numButtons == 0)
//    {
    for (NSString * filterName in filterNames)
    {
        int i = (int)[filterNames indexOfObject:filterName];
        int x = (wh + 10) * i + 10;
    
        UIButton * filterButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 10, wh, wh)];
        filterButton.tag = i;
        filterButton.backgroundColor = [UIColor whiteColor];
    
        [filterButton addTarget:self action:@selector(switchFilter:) forControlEvents:UIControlEventTouchUpInside];
        [filterButtons addObject:filterButton];
        
        [scrollView addSubview:filterButton];
    }
//    }
    
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    scrollView.contentSize = CGSizeMake((wh + 10) * [filterNames count] + 10, self.view.frame.size.height);
    
        //// moved back to PPAViewController .m
    
//    UIButton * libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
//    libraryButton.layer.cornerRadius = 15;
//    libraryButton.backgroundColor = [UIColor whiteColor];
//    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:libraryButton];
    
    

    
    
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
    [self.view addSubview:viewAboveScroller];
    
  
    
}



-(UIImage *)filterImage:(UIImage *)image filterName:(NSString *)filterName

{
    CIImage * ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    CIImage * ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
    
}



-(void)switchFilter:(UIButton *)filterButton;

{
    self.currentFilter = [filterNames objectAtIndex:filterButton.tag];

    UIImage * image = [self filterImage:self.imageToFilter filterName:self.currentFilter];
    
    [self.delegate updateCurrentImageWithFilteredImage:image];
     
     
//    [self filterImage:[self shrinkImage:self.imageToFilter maxWH:SCREEN_WIDTH * 2]
//     
//           [filterName:self.currentFilter];


}



-(void)setImageToFilter:(UIImage *)imageToFilter

{

    _imageToFilter = imageToFilter;
    
    
    for (UIButton * filterButton in filterButtons)
    {
        NSString * filterName = [filterNames objectAtIndex:filterButton.tag];
    
        
//        NSLog(@"%@", filterName);
        
        UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh];
        
        UIImage * image = [self filterImage:smallImage filterName:filterName];
        
        [filterButton setImage:image forState:UIControlStateNormal];
        filterButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
    }

}
// shrinks image to speed up processing
-(UIImage *)shrinkImage:(UIImage *)image maxWH:(int)widthHeight
{

    // unique one-off case making and returning rectangles from picutres.  Dont Worry
    CGSize size = CGSizeMake(widthHeight, widthHeight / image.size.width * image.size.height);
    
    if(image.size.height < image.size.width)
    {
        size = CGSizeMake(widthHeight / image.size.height * image.size.width, widthHeight);
    }

    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return destImage;
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
