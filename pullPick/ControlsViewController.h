//
//  ControlsViewController.h
//  
//
//  Created by Jeffery Moulds on 5/2/14.
//
//

#import <UIKit/UIKit.h>

@protocol ControlsViewControllerDelegate;

@interface ControlsViewController : UIViewController


@property (nonatomic, assign) id<ControlsViewControllerDelegate> delegate;


@end

@protocol ControlsViewControllerDelegate <NSObject>

-(void)selectFilter;

-(void)selectHsb;

-(void)selectBlurr;

@end