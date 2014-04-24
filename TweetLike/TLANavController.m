//
//  TLANavController.m
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TLANavController.h"
#import "TLATableViewController.h"

@interface TLANavController () <UITextViewDelegate>

@end

@implementation TLANavController

{
    UIButton * addNewItem;
    UIView * blueBox;
    
    UIView * tweetInput;
    UITextView * captionField;
    
    UIButton * submit;
    UIButton * cancel;
    
    UIImageView * heartLogo;
    
    UIView * newForm;
    
    TLATableViewController * TVC;
    
}

//- (id)initWithRootViewController:(UIViewController *)rootViewController
//
//{
//
//    self = [super initWithRootViewController:rootViewController];
//    if (self)
//    {
//        
//        
//    }
//    
//    return self;
//}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // custom
    
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];

    
    
    [self.view addSubview:blueBox];
    
    
    newForm = [[UIView alloc] initWithFrame:self.view.frame];
    //        newForm.backgroundColor = [UIColor redColor];
    
//    [blueBox addSubview:newForm];
    
//    [self.view addSubview:newForm];
    
    
    addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height -35), 160, 30)];
    
    addNewItem.backgroundColor = [UIColor whiteColor];
    addNewItem.layer.cornerRadius = 15;
    [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
    addNewItem.titleLabel.textColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
    [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.navigationBar addSubview:addNewItem];
    [blueBox addSubview:addNewItem];
    
    
    
    
    captionField = [[UITextView alloc] initWithFrame:CGRectMake(40, 150, 240, 160)];
    captionField.backgroundColor = [UIColor whiteColor];
    captionField.layer.cornerRadius = 6;
    
    captionField.tintColor =[UIColor blackColor];  // changes cursor color
    captionField.keyboardType = UIKeyboardTypeTwitter;
    
    [newForm addSubview:captionField];
    
    captionField.delegate = self;
    
    
    
    
    submit = [[UIButton alloc] initWithFrame:CGRectMake(20, 320, 100, 30)];
    submit.backgroundColor = [UIColor greenColor];
    submit.layer.cornerRadius = 8;
    
    [submit setTitle:@"Submit" forState:normal];
    [submit setTitleColor:[UIColor blackColor] forState:normal];
    [submit addTarget:self action:@selector(saveTweet) forControlEvents:UIControlEventTouchUpInside];
    
    [newForm addSubview:submit];
    
    
    
    
    //        submit.delegate = self;
    
    
    cancel = [[UIButton alloc] initWithFrame:CGRectMake(200, 320, 100, 30)];
    cancel.backgroundColor = [UIColor redColor];
    cancel.layer.cornerRadius = 8;
    
    [newForm addSubview:cancel];
    
    
    
    
    [cancel setTitle:@"Cancel" forState:normal];
    [cancel setTitleColor:[UIColor blackColor] forState:normal];
    
    [cancel addTarget:self action:@selector(cancelTweet) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    heartLogo = [[UIImageView alloc] initWithFrame:CGRectMake(90, 70, 150, 40)];
    heartLogo.image = [UIImage imageNamed:@"logo"];
    
//    [newForm addSubview:heartLogo];
    
    
    //  slides keyboard back down
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
    [self.view addGestureRecognizer:tap];
    
    
    
    // Do any additional setup after loading the view.
}



-(void)tapScreen  // slides keyboard back down
{
    [captionField resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        
 //       newForm.frame = self.view.frame;
        NSLog (@"Reset Form layout - Slide Down After Keyboard");

    }];
}


//-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
//
//{
//    NSLog(@"Keyboard");
//    [UIView animateWithDuration:0.3 animations:^{
//        
//        newForm.frame = CGRectMake(0, -216, 320, self.view.frame.size.height);
//    }];
//
//    return YES;
//}


-(void)textViewDidBeginEditing:(UITextView *)textView

{
    NSLog(@"Keyboard");
    
    [UIView animateWithDuration:0.3 animations:^{
        
        newForm.frame = CGRectMake(0, -100, 320, self.view.frame.size.height);

        NSLog (@"Reset Form layout - Slide up After Keyboard");
      
    }];
    
}



-(void)newItem:(UIButton *)sender

{
//        [addNewItem removeFromSuperview];

        [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.view.frame;
 //           sender.alpha = 0.0;  // makes the sender button (i.e. submit, disappear on next tweet page) Need to redraw it.
            
        } completion:^(BOOL finished) {    // waits for animation completion before rendering
            
            [blueBox addSubview:newForm];
 
            
            
// on navigation controller for testing ... should be on blue bar or newForm.  change self.view to bluebar.  broken on blue bar.
     
//        [self.view addSubview:heartLogo];
//                             
//        [self.view addSubview:captionField];
//            
//        [self.view addSubview:submit];
//
//        [self.view addSubview:cancel];
            
        }];
    
}


-(void)saveTweet

{

    if ([captionField.text isEqualToString:@""]) return;

    
//One of two methods to add to dictionary.  See TVC .m for other method
    [TVC.tweetItems insertObject:@{                             // addObject puts it at top
                               @"likes" : @0,
                               @"text"  : captionField.text
                               
                               } atIndex:0];
    
    [TVC.tableView reloadData];
    
    captionField.text = @"";
    
    [self cancelTweet];
    

}




-(void)cancelTweet

{
    [newForm removeFromSuperview];
    newForm.frame = self.view.frame;
    newForm.frame = CGRectMake(0, -100, 320, self.view.frame.size.height);

    
    
    [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.navigationBar.frame;
        
                         }];
    
    
        
    NSLog (@"Reset Form layout - Slide up After Keyboard");
    
    
//    [blueBox removeFromSuperview];
//    [heartLogo removeFromSuperview];
//    [captionField removeFromSuperview];
//    [submit removeFromSuperview];
//    [cancel removeFromSuperview];
//
//    
//
//    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
//    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
//    
//    [self.navigationBar addSubview:blueBox];
//    
//    
//    addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height -35), 160, 30)];
//    
//    addNewItem.backgroundColor = [UIColor whiteColor];
//    addNewItem.layer.cornerRadius = 15;
//    [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
//    addNewItem.titleLabel.textColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
//    [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.navigationBar addSubview:addNewItem];
    
    
    
}


//- (void)newTweet
//
//{
//    NSString * newTweetText = captionField.text;         // text in caption field is nsstring named newTweetText
//    captionField.text = @"";
//    
//    [captionField resignFirstResponder];
//    
////    [newTweet2 insertObject:newTweetText atIndex:0];
//    
//    NSLog(@"%@", captionField);
//    
//    NSLog(@"Clicking %@ %@", [self.viewControllers[0] class], newTweetText);
//    
//    // It's more special that just a UIViewController (cuz we added extra methods like addNewTweet
//    // We sometimes force objects to a more 'specialized' type by casting
//    // it's always of the format:
//    // (SpecializedClassName)object
//    // To run this app:
//    // git <fileName>
//    // git file.txt
//    
//    TLATableViewController* t = (TLATableViewController*)self.viewControllers[0];
//    
//    [t addNewTweet:newTweetText];
//    
////    [captionField reloadData];
//    
//}

//-(void)blah:(NSString*)parameterName
//{}
//    
//
//-(void)blah2:(int)parameterName
//{}
//
//
//-(void)blah3:(CGRect)parameterName
//{}

        




-(void)addTableViewController:(TLATableViewController* )viewController

{

    TVC = viewController;
    // dictionary into an array
    
    [self pushViewController:viewController animated:NO];
    
    if ([TVC isTweetItemsEmpty])
        
    {
        [self newItem:nil];  // nil calls the method without requireing the button.  May have been able to pass a button through to manually call the button.
    
    }
        

    
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

- (BOOL)prefersStatusBarHidden { return YES; }


@end
