//
//  TLATableViewController.h
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLATableViewController : UITableViewController <UITextFieldDelegate>

-(void)addNewTweet : (NSString*) newTweet;

@property (nonatomic) NSMutableArray * tweetItems;
@property (nonatomic, getter = isTweetItemsEmpty, readonly) BOOL tweetItemsEmpty;  // makes the bool a question with the getter addition, cannot run setter as empty b/c readonly



//-(void)createNewTweet:(NSString*) tweet;



@end
