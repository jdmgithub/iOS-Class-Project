//
//  SLFTableViewCell.m
//  Selfy
//
//  Created by Jeffery Moulds on 4/21/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "SLFTableViewCell.h"

@implementation SLFTableViewCell


{
    UIImageView * image;
    UILabel * caption;
    
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
 
       
        
//        image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
//        image.layer.cornerRadius = 30;
//        image.layer.masksToBounds = YES;
//
//        [self.contentView addSubview:image];
//        
//        caption = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, 200, 30)];
//        caption.textColor = [UIColor darkGrayColor];
//        caption.font = [UIFont systemFontOfSize:20];
//    
//        [self.contentView addSubview:caption];
    
    
    
    }
    return self;
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
