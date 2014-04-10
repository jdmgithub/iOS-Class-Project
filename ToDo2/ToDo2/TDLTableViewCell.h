//
//  TDLTableViewCell.h
//  ToDo2
//
//  Created by Jeffery Moulds on 4/8/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDLTableViewCell : UITableViewCell

@property (nonatomic) NSDictionary * profileInfo;


@property (nonatomic) UILabel * nameLabel;
@property (nonatomic) UIView * bgView;
@property (nonatomic) UIView * strikeThrough;
@property (nonatomic) UIButton * circleButton;

@property (nonatomic) BOOL swiped; 

- (void)showCircleButtons;
- (void)hideCircleButtons;

- (void)showDeleteButton;
- (void)hideDeleteButton;


@end
