//
//  TLANavController.m
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TLANavController.h"

@interface TLANavController () <UITextFieldDelegate>

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

    
}



- (id)initWithRootViewController:(UIViewController *)rootViewController

{

    self = [super initWithRootViewController:rootViewController];
    if (self)
    {
    // custom
        
//        self.navigationBar.barTintColor = [UIColor blueColor];
//        self.navigationBar.translucent = NO;

        
        blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
        blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
        
        [self.navigationBar addSubview:blueBox];

        
//        newForm = [[UIView alloc] initWithFrame:blueBox.frame];
//        newForm.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:newForm];
        
        
        
        addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height -35), 160, 30)];
    
        addNewItem.backgroundColor = [UIColor whiteColor];
        addNewItem.layer.cornerRadius = 15;
        [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
        addNewItem.titleLabel.textColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
        [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];

        
        
        [self.navigationBar addSubview:addNewItem];
        [newForm addSubview:addNewItem];

        
        
        
        captionField = [[UITextView alloc] initWithFrame:CGRectMake(40, 150, 240, 160)];
        captionField.backgroundColor = [UIColor whiteColor];
        captionField.layer.cornerRadius = 6;
        
        captionField.tintColor =[UIColor blackColor];  // changes cursor color
        captionField.keyboardType = UIKeyboardTypeTwitter;
        
        
//        captionField.delegate = self;

        
        
        submit = [[UIButton alloc] initWithFrame:CGRectMake(20, 320, 100, 30)];
        submit.backgroundColor = [UIColor greenColor];
        submit.layer.cornerRadius = 8;
        
        [submit setTitle:@"Submit" forState:normal];
        [submit setTitleColor:[UIColor blackColor] forState:normal];
 
        cancel = [[UIButton alloc] initWithFrame:CGRectMake(200, 320, 100, 30)];
        cancel.backgroundColor = [UIColor redColor];
        cancel.layer.cornerRadius = 8;

        
        
        
        
        [cancel setTitle:@"Cancel" forState:normal];
        [cancel setTitleColor:[UIColor blackColor] forState:normal];

        [cancel addTarget:self action:@selector(cancelTweet) forControlEvents:UIControlEventTouchUpInside];
        

        
        
        heartLogo = [[UIImageView alloc] initWithFrame:CGRectMake(90, 70, 150, 40)];
        heartLogo.image = [UIImage imageNamed:@"logo"];


//  slides keyboard back down
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
        
    }
    
    return self;
}


-(void)tapScreen  // slides keyboard back down
{
    [captionField resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        
        newForm.frame = self.view.frame;
        
    }];
}



-(void)textViewDidBeginEditing:(UITextView *)textView

{
    NSLog(@"Keyboard");
    
    [UIView animateWithDuration:0.3 animations:^{
        
        newForm.frame = CGRectMake(0, -216, 320, self.view.frame.size.height);
        
    }];
    
}







-(void)newItem:(UIButton *)sender

{
        [UIView animateWithDuration:0.4 animations:^{
        blueBox.frame = self.view.frame;
            
        } completion:^(BOOL finished) {    // waits for animation completion before rendering
            
// on navigation controller for testing ... should be on blue bar or newForm.  change self.view to bluebar.  broken on blue bar.
     
        [self.view addSubview:heartLogo];
                             
        [self.view addSubview:captionField];
            
        [self.view addSubview:submit];

        [self.view addSubview:cancel];
            
        }];
    
}

-(void)cancelTweet

{
// failing
//    [UIView animateWithDuration:0.4 animations:^{
//        blueBox.frame = blueBox.frame;
//    }];
    
    [blueBox removeFromSuperview];
    [heartLogo removeFromSuperview];
    [captionField removeFromSuperview];
    [submit removeFromSuperview];
    [cancel removeFromSuperview];

    
    
    blueBox = [[UIView alloc] initWithFrame:self.navigationBar.frame];
    blueBox.backgroundColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
    
    [self.navigationBar addSubview:blueBox];
    
    
    addNewItem = [[UIButton alloc] initWithFrame:CGRectMake(80, (self.navigationBar.frame.size.height -35), 160, 30)];
    
    addNewItem.backgroundColor = [UIColor whiteColor];
    addNewItem.layer.cornerRadius = 15;
    [addNewItem setTitle:@"Add New" forState:UIControlStateNormal];
    addNewItem.titleLabel.textColor = [UIColor colorWithRed:0.216f green:0.533f blue:0.984f alpha:1.0f];
    [addNewItem addTarget:self action:@selector(newItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.navigationBar addSubview:addNewItem];
    
    
    
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
