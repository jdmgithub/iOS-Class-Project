//
//  TDLTableViewCell.m
//  todo
//
//  Created by Jeffery Moulds on 4/3/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewCell.h"
#import "TDLSingleton.h"

@implementation TDLTableViewCell

//@synthesize profileInfo=_profileInfo;
{


    
UIImageView * profileImage;
UILabel * profileName;
UILabel * profileURL;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {

    profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];

    profileImage.layer.cornerRadius = 30;
    profileImage.layer.masksToBounds = YES;

    [self.contentView addSubview:profileImage];

    profileName = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200, 30)];
    profileName.textColor = [UIColor darkGrayColor];
    profileName.font = [UIFont systemFontOfSize:30];
        
    [self.contentView addSubview:profileName];
 
    profileURL = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 200, 30)];
    profileURL.textColor = [UIColor lightGrayColor];
    profileURL.font = [UIFont systemFontOfSize:16];
        
    [self.contentView addSubview:profileURL];
        
        
        
    }
    return self;
}

//- (NSDictionary *)profileInfo
//{
//    if (_profileInfo == nil)
//    {
////        _profileInfo = @{@"name" :@"Default Name",@"image":[UIImage imageNamed:@"default"]};
////    }
////    
//    return _profileInfo;
//}



-(void)setIndex:(NSInteger)index

{
    _index = index;
    
    NSDictionary * profileInfo = [[TDLSingleton sharedCollection] allListItems] [index];
    
    NSURL * imageUrl = [NSURL URLWithString:profileInfo [@"image"]];
    
    NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
    
    UIImage * image = [UIImage imageWithData:imageData];
    
    profileImage.image= image;
    profileName.text= profileInfo[@"name"];
    profileURL.text= profileInfo[@"github"];

}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
