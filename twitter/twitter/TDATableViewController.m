//
//  TDATableViewController.m
//  twitter
//
//  Created by Jeffery Moulds on 4/13/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDATableViewController.h"

@interface TDATableViewController ()

@end

@implementation TDATableViewController

{
    NSMutableArray * tweetLists;
    UITextField * nameField;

}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization


        tweetLists = [@[] mutableCopy];

        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.tableView.rowHeight = 150;
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 130)];
        header.backgroundColor = [UIColor grayColor];
        self.tableView.tableHeaderView = header;
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 45, 280, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:1.0];
        nameField.layer.cornerRadius = 6;
        
//        nameField.delegate = self;
        
        [header addSubview:nameField];

    
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 280, 30)];
        [submitButton setTitle:@"New Tweets" forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:14];
        submitButton.backgroundColor = [UIColor blackColor];
        submitButton.layer.cornerRadius = 6;

        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
        
        [header addSubview:submitButton];
  
 
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 280, 30)];
        titleHeader.text = @"Twitter Data";
        titleHeader.textColor = [UIColor lightGrayColor];
        titleHeader.font = [UIFont systemFontOfSize:26];
        
        [header addSubview:titleHeader];
    
    
    
    
    
    
    }
    return self;
}






- (void)newUser
{
    NSString * username = nameField.text;
    nameField.text = @"";
    
    //    NSLog(@"%@", username);
    
    
    NSLog(@"clicking");
    
//            [tweetLists addObject:@{@"name" : username,
//              @"image" : [UIImage imageNamed:@"new_user"],
//                @"github" : [NSString stringWithFormat:@"https://github.com/%@", username]}
//             ];
//    
//    NSDictionary * userTweets = [TDLGitHubRequest getUserWithUsername:username];
    

}










- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
//#warning Incomplete method implementation.
    // Return the number of rows in the section.

    return [tweetLists count];
}







//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//
//    
//    return cell;
//}


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

@end
