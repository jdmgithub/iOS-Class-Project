//
//  NAVTableViewCellColors.m
//  NavPracticeApp
//
//  Created by Jeffery Moulds on 5/18/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "NAVTableViewCellColors.h"

@implementation NAVTableViewCellColors

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
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
