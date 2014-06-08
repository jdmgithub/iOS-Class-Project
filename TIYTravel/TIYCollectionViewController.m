//
//  TIYCollectionViewController.m
//  GridLayout
//
//  Created by Jeffery Moulds on 5/30/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "TIYCollectionViewController.h"
#import "TIYCollectionCell.h"

//#import "TIYLaunchCollectionVC.h"
//#import "TIYLaunchViewController.h"

@interface TIYCollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation TIYCollectionViewController

{
    NSArray * images;
    TIYCollectionCell * colCell;
}



-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{

    self = [super initWithCollectionViewLayout:layout];
    
    if (self)
    {
     
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        
        self.collectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        images = @[
                   @"Congo",
                   @"Godzilla",
                   @"Weekend At Bernies",
                   @"Big",
                   @"Ed",
                   @"Babe",
                   @"Firefox",
                   @"Batman",
                   @"Congo22",
                   @"Godzilla22",
                   @"Weekend At Bernies22",
                   @"Big22",
                   @"Ed22",
                   @"Babe22",
                   @"Firefox22",
                   @"Batman22",
                   @"Pi"
                   ];
        
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{

        // High Numbers Lets it Scroll e.g. 200
    return [images count];

}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{

    
        return CGSizeMake(215 , 215);
//    return CGSizeMake((SCREEN_WIDTH - 50) / 4.0, (SCREEN_HEIGHT - 50) /8.0);

}


-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section

{

    return 20.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section

{
    return 1.0;

}




- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    TIYCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width - 20, 30)];
    
    
    title.textColor = [UIColor whiteColor];
    
    
    
    title.text = images[indexPath.row];
    
    [cell.contentView addSubview:title];
    
    cell.backgroundColor = [UIColor darkGrayColor];
    return cell;

}










- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
