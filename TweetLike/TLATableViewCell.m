//
//  TLATableViewCell.m
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TLATableViewCell.h"

@implementation TLATableViewCell

{
    UILabel * textLabel;
    UILabel * likesLabel;

}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code


        
        UIImageView * heart = [[UIImageView alloc] initWithFrame:CGRectMake(20, 30, 20, 20)];
        heart.image = [UIImage imageNamed:@"heart"];
        [self.contentView addSubview:heart];
        
   
        likesLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, 60, 20)];
        likesLabel.text = @"55";
        likesLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:likesLabel];
    
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 200, 80)];
        textLabel.text = @"55555555555555555555555555555555555555555555555555555555555555555555";
        textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        textLabel.numberOfLines = 0;
        textLabel.font = [UIFont systemFontOfSize:12];
        
        [self.contentView addSubview:textLabel];
        
    }
    return self;

}


-(void)setTweet:(NSDictionary *)tweet
{
 // always do _prpoerty = property
    
    _tweet = tweet;

    likesLabel.text = [tweet[@"likes"] stringValue]; // makes a string a number so it works
    textLabel.text = tweet[@"text"];
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
