//
//  TDLTableViewController.m
//  ToDo2
//
//  Created by Jeffery Moulds on 4/8/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{
    UITextField * itemField;
    NSMutableArray *listItems;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {


        
//      Header
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 55)];
        
        self.tableView.tableHeaderView = header;

        
//      TextField
        itemField = [[UITextField alloc] initWithFrame:CGRectMake(20, 30, 160, 30)];
        itemField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.05];
        itemField.layer.cornerRadius = 6;
        itemField.placeholder = @"  To Do Item";
        
        [header addSubview:itemField];

        
//      Buttons
        UIButton * lowprioritybutton = [[UIButton alloc] initWithFrame:CGRectMake(200, 30, 30, 30)];
        lowprioritybutton.backgroundColor = [UIColor greenColor];
        lowprioritybutton.layer.cornerRadius = 15;
        [lowprioritybutton addTarget:self action:@selector(newItem) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview: lowprioritybutton];

 
        UIButton * mediumprioritybutton = [[UIButton alloc] initWithFrame:CGRectMake(240, 30, 30, 30)];
        mediumprioritybutton.backgroundColor = [UIColor orangeColor];
        mediumprioritybutton.layer.cornerRadius = 15;
        [mediumprioritybutton addTarget:self action:@selector(newItem) forControlEvents:UIControlEventTouchUpInside];
        [header addSubview: mediumprioritybutton];
        

        UIButton * highprioritybutton = [[UIButton alloc] initWithFrame:CGRectMake(280, 30, 30, 30)];
        highprioritybutton.backgroundColor = [UIColor redColor];
        highprioritybutton.layer.cornerRadius = 15;
        [header addSubview: highprioritybutton];
        [highprioritybutton addTarget:self action:@selector(newItem) forControlEvents:UIControlEventTouchUpInside];
        
//        listItems = [@[
////                       @{@"Task" : @"XXXX", @"Priority" : @"XXXX", @"Complete" : @"Yes"}
//                 
//                       ] mutableCopy];

        listItems = [@[]mutableCopy];
        
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;
        
        
    }
    return self;
}


// Text Field Entry
- (void)newItem

{
    NSString * itemName = itemField.text;
    itemField.text = @"";

    [itemField resignFirstResponder];
    
    [listItems insertObject:itemName atIndex:0];
    
//    NSLog(@"%@", itemName);
    
    [self.tableView reloadData];
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [listItems count];
}




// Configure the cell...

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    NSLog(@"%@",listItems[indexPath.row]);
    
    cell.textLabel.text = listItems[indexPath.row];
    
    return cell;

}




- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];

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

@end
