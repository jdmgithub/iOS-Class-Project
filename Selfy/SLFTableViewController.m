//
//  SLFTableViewController.m
//  Selfy
//
//  Created by Jeffery Moulds on 4/21/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "SLFTableViewController.h"
#import "SLFTableViewCell.h"

@interface SLFTableViewController ()

@end

@implementation SLFTableViewController


{
    UIButton * settingsButton;
    UIButton * editButton;
    NSMutableArray * selfyData;
    
    
}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

        // header

        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:header];
        
 //       [settingsButton = [UIButtonTypeContactAdd];
        
        
        
        
        settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
        settingsButton.backgroundColor = [UIColor darkGrayColor];
        settingsButton.layer.cornerRadius = 15;
        [settingsButton setTitle:@"S" forState:UIControlStateNormal];
        settingsButton.titleLabel.font = [UIFont systemFontOfSize:18];


        
        [header addSubview:settingsButton];
        
        editButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 10, 30, 30)];
        editButton.backgroundColor = [UIColor darkGrayColor];
        editButton.layer.cornerRadius = 15;
        [editButton setTitle:@"+" forState:UIControlStateNormal];
        editButton.titleLabel.font = [UIFont systemFontOfSize:18];

        
        [header addSubview:editButton];
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.tableView.rowHeight = 230;
        

        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(130, 0, 60, 70)];
        titleHeader.text = @"Selfy";
        titleHeader.textColor = [UIColor blackColor];
        titleHeader.font = [UIFont systemFontOfSize:24];
        
        [header addSubview:titleHeader];

    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    selfyData = [@[
                   
                   @{@"image" : @"url",
                     @"caption" : @"string - Caption Test String",
                     @"user_id" : @"string - User_ID Test String",
                     @"avatar" : @"url"
                     }
                   
                   ] mutableCopy];
    
    
    
    
    
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
   
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [selfyData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * selfy = selfyData[indexPath.row];
    
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"cell"];
    
    }
    
    // Configure the cell...

//    cell.textLabel.text = selfy[@"caption"];
//    cell.detailTextLabel.text = selfy[@"user_id"];
    


    
    
    return cell;
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

//- (BOOL)prefersStatusBarHidden { return YES; }


@end
