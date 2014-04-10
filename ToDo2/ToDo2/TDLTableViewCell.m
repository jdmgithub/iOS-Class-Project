//
//  TDLTableViewCell.m
//  ToDo2
//
//  Created by Jeffery Moulds on 4/8/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewCell.h"

#import "MOVE.h"

UILabel * taskName;

@implementation TDLTableViewCell
{
    UIButton * lowbutton;
    UIButton * medbutton;
    UIButton * highbutton;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
        
    {
        
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 15, 300, 40)];
        self.bgView.layer.cornerRadius = 6;
        
        [self.contentView addSubview:self.bgView];
        
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, -10, 200, 57)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:26];
        
        
        [self.bgView addSubview:_nameLabel];
        
        
        self.strikeThrough = [[UIView alloc] initWithFrame:CGRectMake(5, 22, self.frame.size.width - 30, 2)];
        self.strikeThrough.backgroundColor = [UIColor whiteColor];
        self.strikeThrough.alpha = 0;
        [self.bgView addSubview:self.strikeThrough];
        
        
        
        self.circleButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, 10, 20, 20)];
        self.circleButton.backgroundColor = [UIColor whiteColor];
        self.circleButton.layer.cornerRadius = 10;
        
        [self.bgView addSubview:self.circleButton];
        
        
        
        
    }
    return self;
}


- (void) resetLayout

{
//    if (self.swiped)
//    {
//        [self. createButtons];
//        self.swiped = YES;
//        
//    } else {

    
   self.bgView.frame = CGRectMake(10, 15, 300, 40);
    [lowbutton removeFromSuperview];
    [medbutton removeFromSuperview];
    [highbutton removeFromSuperview];
    self.swiped = NO;
    
    }
    





//-(void) profileInfo:(NSDictionary *)profileInfo
//
//{
//    profileName.text= profileInfo[@"name"];
//    _profileInfo = profileInfo;
//
//}

//    NSURL * imageUrl = [NSURL URLWithString:profileInfo [@"image"]];
//
//    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
//
//    UIImage * image = [UIImage imageWithData:imageData];
//
//    profileImage.image= image;
//    profileName.text= profileInfo[@"name"];
//    profileURL.text= profileInfo[@"github"];
//
//
//    _profileInfo = profileInfo;



- (void)createButtons

{

    //      Buttons
    lowbutton = [[UIButton alloc] initWithFrame:CGRectMake(170, 15, 40, 40)];
    lowbutton.tag = 1;
    lowbutton.alpha = 0;
    lowbutton.backgroundColor = ORANGE_COLOR;
    lowbutton.layer.cornerRadius = 20;
    [lowbutton addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [lowbutton setTitle:@"L" forState:UIControlStateNormal];
    //    [header addSubview: lowbutton];
    [self.contentView addSubview:lowbutton];
    
    medbutton = [[UIButton alloc] initWithFrame:CGRectMake(220, 15, 40, 40)];
    medbutton.tag = 2;
    medbutton.alpha = 0;
    medbutton.backgroundColor = YELLOW_COLOR;
    medbutton.layer.cornerRadius = 20;
    [medbutton addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [medbutton setTitle:@"M" forState:UIControlStateNormal];
    [self.contentView addSubview:medbutton];
    
    highbutton = [[UIButton alloc] initWithFrame:CGRectMake(270, 15, 40 , 40)];
    highbutton.tag = 3;
    highbutton.alpha = 0;
    highbutton.backgroundColor = RED_COLOR;
    highbutton.layer.cornerRadius = 20;
    [highbutton setTitle:@"H" forState:UIControlStateNormal];
    [highbutton addTarget:self action:@selector(pressPriorityButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:highbutton];



}

-(void)pressPriorityButton:(id)sender
{
    UIButton * button = (UIButton *)sender;
    
    [self.delegate setItemPriority:(int)button.tag withItem:self];
    
}


-(void)showCircleButtons
{

    [self createButtons];

    
    
    [MOVE animateView:lowbutton properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.3}];
    [MOVE animateView:medbutton properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.2}];
    [MOVE animateView:highbutton properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.1}];
    
    
}


-(void)hideCircleButtons
{
    
    [MOVE animateView:lowbutton properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.0,  @"remove":@YES}];
    [MOVE animateView:medbutton properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.1, @"remove":@YES}];
    [MOVE animateView:highbutton properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.2, @"remove":@YES}];
    
}

-(void)showDeleteButton
{

    highbutton = [[UIButton alloc] initWithFrame:CGRectMake(270, 15, 40 , 40)];
    highbutton.tag = 3;
    highbutton.alpha = 0;
    highbutton.backgroundColor = RED_COLOR;
    highbutton.layer.cornerRadius = 20;
    [highbutton setTitle:@"X" forState:UIControlStateNormal];
    highbutton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:30];
    [highbutton addTarget:self action:@selector(pressDeleteButton) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:highbutton];

    [MOVE animateView:highbutton properties:@{@"alpha":@1,@"duration":@0.2,@"delay":@0.3}];

    
    
    
}

-(void)pressDeleteButton
{

    [self.delegate deleteItem:self];  // self.delegate = tableviewcontroller... self = tableviewcellcontroller

}





-(void)hideDeleteButton
{
    
    [MOVE animateView:highbutton
           properties:@{@"alpha":@0,@"duration":@0.2,@"delay":@0.0, @"remove":@YES}];

}



- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
