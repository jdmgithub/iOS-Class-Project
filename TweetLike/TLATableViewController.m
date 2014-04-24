//
//  TLATableViewController.m
//  TweetLike
//
//  Created by Jeffery Moulds on 4/23/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TLATableViewController.h"
#import "TLATableViewCell.h"

@interface TLATableViewController ()

@end

@implementation TLATableViewController

{
    UIImageView * heartView;
    UIView * header;
    UIButton * addNewButton;
    
//    NSMutableArray * tweetItems;

}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization


        
        self.tweetItems = [
  
                    @[
                        
                        @{
                            @"text" :@"No more shalll I go on, without first looking ahead.",
                            @"likes": @35
                        },
          
                        @{
                            @"text" : @"Blah Blah.",
                            @"likes": @35
                            
                            }
                        
                    ]
                      mutableCopy ];
                      }
 
    
    
    self.tableView.rowHeight = 80;


    
//        header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//        header.backgroundColor = [UIColor blueColor];
//        
//        [self.view addSubview:header];
//        
//        
//        addNewButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 20, 60, 40)];
//
//        addNewButton.backgroundColor = [UIColor whiteColor];
//        addNewButton.layer.cornerRadius = 15;
//        [addNewButton setTitle:@"Add New" forState:UIControlStateNormal];
//        addNewButton.titleLabel.font = [UIFont systemFontOfSize:18];
//
//        [self.view addSubview:addNewButton];

    return self;
}


-(void)addNewTweet : (NSString*) newTweet;
{
    NSLog(@"Testing New Tweet in TVC.m");

}





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.tweetItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLATableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    

    //  If emptly, sets the cell content as the TLATableViewCell with Default Style
    if (cell == nil)
    {
        cell = [[TLATableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    
    cell.tweet = self.tweetItems[indexPath.row];
    
   
//    DONT [DO THIS LAGGY]
//    UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    return cell;
}
//-(void)createNewTweet:(NSString *)tweet
//
//
//{
//
//    if ([tweet isEqualToString:@""]) return;
//
//   
//    
//    [self.tweetItems insertObject:@{                             // addObject puts it at top
//                                   @"likes" : @0,
//                                   @"text"  : tweet
//                                   
//                                   } atIndex:0];
//    
//    [self.tableView reloadData];
//
//
//}


-(BOOL)isTweetItemsEmpty

{
    return ([self.tweetItems count] == 0);   // if self.tweetitems count = 0, it is empty
    
    
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)prefersStatusBarHidden { return YES; }

                        
@end
