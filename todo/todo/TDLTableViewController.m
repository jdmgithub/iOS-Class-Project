//
//  TDLTableViewController.m
//  todo
//
//  Created by Jeffery Moulds on 4/2/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewController.h"

#import "TDLTableViewCell.h"

#import "TDLGitHubRequest.h"

@implementation TDLTableViewController

{
 
    NSMutableArray *listItems;
    UITextField * nameField;
//    UINavigationController * navController;
    
//    NSArray *listImages;
    
}

- (void)toggleEdit

{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    
    //    self.tableView.editing = !self.tableView.editing;
    
//    [self.tableView reloadData];

}



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {

//        UIWindow * window = [[UIApplication sharedApplication].windows firstObject];
//        navController = (UINavigationController *)window.rootViewController;
        

        UIBarButtonItem * editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(toggleEdit)];

        self.navigationItem.rightBarButtonItem = editButton;
        
        
        
        // NSDictionary * list = [NSDictionary alloc] initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>;
        
//    NSDictionary * list = @{
//           @"name" : @"Savitha Reddy",
//           @"image" : [UIImage imageNamed:@"SavithaReddy"]
        
//                            };
        
      
//    listItems =[@[
//  @{@"name" : @"Ali Houshmand", @"image" : [UIImage imageNamed:@"AliHoushmand"], @"github" : @"https://github.com/HoushmandA06"},
//  @{@"name" : @"Ashby Thronwell", @"image" : [UIImage imageNamed:@"AshbyThornwell"], @"github" : @"https://github.com/athornwell"},
//  @{@"name" : @"Austen Johnson", @"image" : [UIImage imageNamed:@"AustenJohnson"], @"github" : @"https://github.com/ajohnson21"},
//  @{@"name" : @"Austin Nolan", @"image" : [UIImage imageNamed:@"AustinNolan"], @"github" : @"https://github.com/adnolan99"},
//  @{@"name" : @"Derek Weber", @"image" : [UIImage imageNamed:@"DerekWeber"], @"github" : @"https://github.com/dweber03"},
//  @{@"name" : @"Ed Salter", @"image" : [UIImage imageNamed:@"edsalter"], @"github" : @"https://github.com/MadArkitekt"},
//  @{@"name" : @"Heidi Proske", @"image" : [UIImage imageNamed:@"HeidiProske"], @"github" : @"https://github.com/justagirlcoding"},
//  @{@"name" : @"Jeff King", @"image" : [UIImage imageNamed:@"JeffKing"], @"github" : @"https://github.com/rampis"},
//  @{@"name" : @"Jeffery Moulds", @"image" : [UIImage imageNamed:@"JefferyMoulds"], @"github" : @"https://github.com/jdmgithub"},
//  @{@"name" : @"Jisha Obukwelu", @"image" : [UIImage imageNamed:@"JishaObukwelu"], @"github" : @"https://github.com/Jiobu"},
//  @{@"name" : @"John Yam", @"image" : [UIImage imageNamed:@"JohnYam"], @"github" : @"https://github.com/yamski"},
//  @{@"name" : @"Jon Fox", @"image" : [UIImage imageNamed:@"JonFox"], @"github" : @"https://github.com/FoxJon"},
//  @{@"name" : @"Savitha Reddy", @"image" : [UIImage imageNamed:@"SavithaReddy"], @"github" : @"https://github.com/savithareddy"},
//  @{@"name" : @"Teddy Conyers", @"image" : [UIImage imageNamed:@"TeddyConyers"], @"github" : @"https://github.com/talented76"},
//  @{@"name" : @"T.J Mercer", @"image" : [UIImage imageNamed:@"TJMercer"], @"github" : @"https://github.com/gwanunig14"}
//
//                ] mutableCopy];
        

        listItems = [@[
                       @{
                       @"name" : @"Jo Albright",
                       @"image" : @"https://avatars.githubusercontent.com/u/1536630?",
                       @"github" : @"https://github.com/joalbright"
                       },
                       
                       @{
                       @"name" : @"John Yam",
                       @"image" : @"https://avatars1.githubusercontent.com/u/2688381",
                       @"github" : @"https://github.com/yamski"
                       }
                       ] mutableCopy];
        

        
        
        
        self.tableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
        self.tableView.rowHeight = 100;

        
        
        
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
        
        self.tableView.tableHeaderView = header;
//        header.backgroundColor = [UIColor grayColor];

        
//        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
//        titleHeader.text = @"Class Contacts";
//        titleHeader.textColor = [UIColor whiteColor];
//
//        [header addSubview:titleHeader];

        nameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 160, 30)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.05];
        nameField.layer.cornerRadius = 6;
        
        nameField.delegate = self;
        
        [header addSubview:nameField];

        
        UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        [submitButton setTitle:@"New User" forState:UIControlStateNormal];
        submitButton.titleLabel.font = [UIFont systemFontOfSize:12];
        submitButton.backgroundColor = [UIColor darkGrayColor];
        submitButton.layer.cornerRadius = 6;
        [submitButton addTarget:self action:@selector(newUser) forControlEvents:UIControlEventTouchUpInside];
        
        [header addSubview:submitButton];
        
        
        
        UILabel * titleHeader = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 280, 30)];
        titleHeader.text = @"GitHub Users";
        titleHeader.textColor = [UIColor lightGrayColor];
        titleHeader.font = [UIFont systemFontOfSize:26];

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



- (void)newUser
{
    NSString * username = nameField.text;
    nameField.text = @"";

//    NSLog(@"%@", username);
    
    
    NSLog(@"clicking");

//        [listItems addObject:@{@"name" : username,
////          @"image" : [UIImage imageNamed:@"new_user"],
//            @"github" : [NSString stringWithFormat:@"https://github.com/%@", username]}
//         ];
    
    NSDictionary * userInfo = [TDLGitHubRequest getUserWithUsername:username];
    
    if([[userInfo allKeys] count] ==3) [listItems addObject:userInfo];
    else NSLog(@"Not Enough Data");
    
    [nameField resignFirstResponder];

    [self.tableView reloadData];
    
//    NSLog(@"listItems Count : %d",[listItems count]);
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField

{
//    NSLog(@"return key");
    [self newUser];
    return YES;

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

    TDLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];


    if (cell == nil) cell = [[TDLTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    

//    int index = indexPath.row;
    

    
//      cell.textLabel.text = listItems[index];
//      cell.imageView.image = listImages[index];
   
//    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];

    
    

//    NSDictionary * listItem = [self getListItem:indexPath.row];

    cell.profileInfo = [self getListItem:indexPath.row];
    
//    cell.textLabel.text = listItem[@"name"];
//    cell.imageView.image = listItem[@"image"];
    
    
//      NSString * day=listItems[index];

//      cell.textLabel.text = day;
    
//      Configure the cell...
    
    return cell;

    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
//    int index = indexPath.row;

    
//    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    
    
    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    NSLog(@"%@", listItem);

    UIViewController * webController =[[UIViewController alloc] init];
    
    UIWebView * webView = [[UIWebView alloc] init];

    webController.view = webView;
    

    
    [self.navigationController pushViewController:webController animated:YES];
    
    NSURL * url = [NSURL URLWithString:listItem[@"github"]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
//    [webView loadRequest:[NSURLRequest requestWithURL: [NSURL URLWithString:listItem[@"github"]]]];
    
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath

    {
    return YES;
    };

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [listItems removeObjectAtIndex:indexPath.row];

    NSDictionary * listItem = [self getListItem:indexPath.row];
    
    [listItems removeObjectIdenticalTo:listItem];
    
    [self.tableView reloadData];
    
    NSLog(@"%@", listItems);
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{

    if (sourceIndexPath == destinationIndexPath) return;
        
    NSDictionary * sourceItem = [self getListItem:sourceIndexPath.row];
    
    NSDictionary * toItem = [self getListItem:destinationIndexPath.row];
    
    [listItems removeObjectIdenticalTo:sourceItem];
    
    //    [listItems removeObjectAtIndex:[listItems indexOfObject:sourceItem]];
    
    [listItems insertObject:sourceItem atIndex:[listItems indexOfObject:toItem]];
    



}


- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
    
}

@end
