//
//  TDLTableViewController.m
//  todo
//
//  Created by Jeffery Moulds on 4/2/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewController.h"




@implementation TDLTableViewController

{
 
    NSArray *listItems;
    NSArray *listImages;
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {

    // NSDictionary * list = [NSDictionary alloc] initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>;
        
    //    NSDictionary * list = @{
    //                            @"name" : @"Savitha Reddy",
    //                            @"image" : [UIImage imageNamed:@"SavithaReddy"]
                                
        
    //                            };
        
      
    listItems =@[
@{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"AliHoushmand"]},
@{@"name" : @"Ashby Thronwell", @"image" : [UIImage imageNamed:@"AshbyThornwell"]},
@{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed:@"AustenJohnson"]},
@{@"name" : @"Austin Nolan", @"image" : [UIImage imageNamed:@"AustinNolan"]},
@{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"DerekWeber"]},
@{@"name" : @"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"]},
@{@"name" : @"Heidi Proske", @"image" : [UIImage imageNamed:@"HeidiProske"]},
@{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"JeffKing"]},
@{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"JefferyMoulds"]},
@{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"JishaObukwelu"]},
@{@"name" : @"John Yam", @"image" : [UIImage imageNamed:@"JohnYam"]},
@{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"JonFox"]},
@{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed:@"SavithaReddy"]},
@{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"TeddyConyers"]},
@{@"name" : @"T.J Mercer", @"image" : [UIImage imageNamed:@"TJMercer"]}

                ];
        
        
        
//    listItems = @[@"Ali Houshmand", @"Ashby Thronwell", @"Austen Johnson", @"Austin Nolan", @"Derek Weber", @"Ed Salter", @"Heidi Proske", @"Jeff King", @"Jeffery Moulds", @"Jisha Obukwelu", @"John Yam", @"Jon Fox", @"Savitha Reddy", @"Teddy Conyers", @"T.J. Mercer"];

        
        
//    listImages = @[
//                       [UIImage imageNamed:@"AliHoushmand"],
//                       [UIImage imageNamed:@"AshbyThornwell"],
//                       [UIImage imageNamed:@"AustenJohnson"],
//                       [UIImage imageNamed:@"AustinNolan"],
//                       [UIImage imageNamed:@"DerekWeber"],
//                       [UIImage imageNamed:@"edsalter"],
//                       [UIImage imageNamed:@"HeidiProske"],
//                       [UIImage imageNamed:@"JeffKing"],
//                       [UIImage imageNamed:@"JefferyMoulds"],
//                       [UIImage imageNamed:@"JishaObukwelu"],
//                       [UIImage imageNamed:@"JohnYam"],
//                       [UIImage imageNamed:@"JonFox"],
//                       [UIImage imageNamed:@"SavithaReddy"],
//                       [UIImage imageNamed:@"TeddyConyers"],
//                       [UIImage imageNamed:@"TJMercer"]
//                    ];
   
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
//        self.tableView.rowHeight = 100;
        
       
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor grayColor];
        
        self.tableView.tableHeaderView = header;
        
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
        titleHeader.text = @"Class Contacts";
        titleHeader.textColor = [UIColor whiteColor];

        [header addSubview:titleHeader];
        
        
 
        UIView * footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        footer.backgroundColor = [UIColor grayColor];

        UILabel * titlefooter = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
        
        titlefooter.text = @"End of List";
        titlefooter.textColor = [UIColor whiteColor];

        [footer addSubview:titlefooter];
     
        self.tableView.tableFooterView = footer;
        
        
    }

    return self;
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



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    
    // Return the number of rows in the section.
    return [listItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] init];
    }
    
//  int index = [indexPath row];  THIS IS THE SAME AS NEXT LINE - an alias/shorthand
    int index = indexPath.row;

    
//      cell.textLabel.text = listItems[index];

//      cell.imageView.image = listImages[index];
   

    NSDictionary * listItem = listItems[index];
    cell.textLabel.text = listItem[@"name"];
    cell.imageView.image = listItem[@"image"];
    
    
//      NSString * day=listItems[index];

//      cell.textLabel.text = day;
    
//      Configure the cell...
    
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

@end
