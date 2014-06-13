//
//  TAPFBCollectionVC.m
//  Time and Place
//
//  Created by Savitha Reddy on 6/7/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "TAPFBCollectionVC.h"
#import "TAPFaceBookRequests.h"

@interface TAPFBCollectionVC ()  <UICollectionViewDelegateFlowLayout>

@end

@implementation TAPFBCollectionVC
{
    NSArray *photosFbook;
}

-(id)initWithCollectionViewLayout:(UICollectionViewFlowLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    if(self)
    {
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        self.collectionView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
        //        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        photosFbook = [TAPFaceBookRequests getPhotosWithFaceB];
//        NSLog(@" photos in collectionVC is %@",photosFbook);
        
    }
    return self;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(215, 215);
    //    return CGSizeMake((SCREEN_WIDTH-50)/2.0, (SCREEN_HEIGHT-50)/4.0);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1.0;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //    NSLog(@"photos count is %d",(int)[photos count]);
    return [photosFbook count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //    NSLog(@"All photos are %@",photos);
    
    UIImageView * imageview = [[UIImageView alloc] initWithImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:photosFbook[indexPath.row]]]]];
    imageview.frame = CGRectMake(0, 0, 200, 200);
    
    [cell.contentView addSubview:imageview];
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
