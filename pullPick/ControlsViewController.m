//
//  ControlsViewController.m
//  
//
//  Created by Jeffery Moulds on 5/2/14.
//
//

#import "ControlsViewController.h"

@interface ControlsViewController ()

@end

@implementation ControlsViewController

{
    UIView * controlsView;
    UIButton * filterButton;
    UIButton * hsbButton;
    UIButton * blurrButton;
    
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    
    
    
    }
    return self;
}





- (void)viewWillLayoutSubviews
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
controlsView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 140, SCREEN_WIDTH, 40)];
//controlsView.backgroundColor = [UIColor lightGrayColor];

    
[self.view addSubview:controlsView];


filterButton = [[UIButton alloc] initWithFrame:CGRectMake(38, 5, 30, 30)];
filterButton.backgroundColor = [UIColor whiteColor];
[filterButton setImage:[UIImage imageNamed:@"filter"] forState:(UIControlStateNormal)];
    
    
[filterButton addTarget:self.delegate action:@selector(selectFilter) forControlEvents:UIControlEventTouchUpInside];


[controlsView addSubview:filterButton];



hsbButton = [[UIButton alloc] initWithFrame:CGRectMake(145, 5, 30, 30)];
hsbButton.backgroundColor = [UIColor whiteColor];
[hsbButton setImage:[UIImage imageNamed:@"HSB"] forState:(UIControlStateNormal)];
    
[hsbButton addTarget:self.delegate action:@selector(selectHsb) forControlEvents:UIControlEventTouchUpInside];

[controlsView addSubview:hsbButton];


    
blurrButton = [[UIButton alloc] initWithFrame:CGRectMake(252, 5, 30, 30)];
blurrButton.backgroundColor = [UIColor whiteColor];
[blurrButton setImage:[UIImage imageNamed:@"blur"] forState:(UIControlStateNormal)];
    
[blurrButton addTarget:self.delegate action:@selector(selectBlurr) forControlEvents:UIControlEventTouchUpInside];

[controlsView addSubview:blurrButton];

controlsView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    
}



//
//-(void)selectfilter
//{
//
//    [self.delegate selectFilter];
//    
//}
//
//
//-(void)selecthsb
//
//{
//
//    [self.delegate selectHsb];
//    
//    
//}
//
//-(void)selectblurr
//{
//
//    [self.delegate selectBlurr];
//
//
//}




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



// viewController.m
//  @interafce <ControlsViewControllerDelegate>
//  -void(selectEditingTool: (UIButton *) button


@end
