//
//  TDLTableViewCell.m
//  ToDo2
//
//  Created by Jeffery Moulds on 4/8/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewCell.h"

UILabel * taskName;

@implementation TDLTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    
    {
        
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 15, 300, 40)];
    
    self.bgView.layer.cornerRadius = 6;

        [self.contentView addSubview:self.bgView];

        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 200, 30)];
        self.nameLabel.textColor = [UIColor whiteColor];
        self.nameLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:26];
                               
                               
                               
        
        [self.contentView addSubview:_nameLabel];
        
    }
    return self;
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
