//
//  GLACollectionViewController.m
//  GridLayout
//
//  Created by Jeffery Moulds on 5/30/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "TIYCollectionViewController.h"
//#import "TIYLaunchCollectionVC.h"
//#import "TIYLaunchViewController.h"

@interface TIYCollectionViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation TIYCollectionViewController

{
    NSArray * movies;
}



-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{

    self = [super initWithCollectionViewLayout:layout];
    
    if (self)
    {
     
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        
        self.collectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        movies = @[
                   @"Congo",
                   @"Godzilla",
                   @"Weekend At Bernies",
                   @"Big",
                   @"Ed",
                   @"Babe",
                   @"Firefox",
                   @"Batman",
                   @"Pi"
                   ];
        
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{

        // High Numbers Lets it Scroll e.g. 200
    return [movies count];

}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{

    
        return CGSizeMake(175 , 175);
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


    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    

    UILabel * title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, cell.frame.size.width - 20, 30)];
    
    title.textColor = [UIColor redColor];
    
    title.text = movies[indexPath.row];
    
    
    [cell.contentView addSubview:title];
    
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;

}










- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
