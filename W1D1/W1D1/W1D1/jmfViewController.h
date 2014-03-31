//
//  jmfViewController.h
//  W1D1
//
//  Created by Jeffery Moulds on 3/31/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jmfViewController : UIViewController


- (IBAction)buttonOne:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelOne;


- (IBAction)buttonTwo:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelTwo;


- (IBAction)buttonThree:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelThree;

@property (weak, nonatomic) IBOutlet UITextField *textEntry;

@end
