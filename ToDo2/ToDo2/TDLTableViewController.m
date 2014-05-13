//
//  TDLTableViewController.m
//  ToDo2
//
//  Created by Jeffery Moulds on 4/8/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "TDLTableViewController.h"
#import "TDLTableViewCell.h"
#import "MOVE.h"

@interface TDLTableViewController ()

@end

@implementation TDLTableViewController
{
    UITextField * itemField;
    NSMutableArray * listItems;
    NSArray * priorityColors;
    UIButton * lowbutton;
    UIButton * medbutton;
    UIButton * highbutton;
    
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        
        //  Dictionary
        priorityColors = @[TAN_COLOR, YELLOW_COLOR, ORANGE_COLOR, RED_COLOR];
        
        listItems = [@[
                       @{@"name" : @"Workshop App", @"priority" : @3, @"constant" : @3},
                       @{@"name": @"Go To Blogging Thing", @"priority" : @2, @"constant" : @2},
                       @{@"name" : @"Learn Objective - C", @"priority" : @1, @"constant" : @1},
                       @{@"name" : @"Finish GitHub App", @"priority" : @0, @"constant" : @0}
                       ] mutableCopy];
        
        //      Header
        UIView * header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
        
        self.tableView.tableHeaderView = header;
        
        
        //      TextField
        itemField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 150, 40)];  // position of field
        itemField.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.05];  // background color
        itemField.leftViewMode = UITextFieldViewModeAlways;    // changes curser position
        itemField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)]; // changes curser position
        itemField.layer.cornerRadius = 6;  // rounds corners
        itemField.placeholder = @"  To Do Item";  // placeholder text
        itemField.tintColor =[UIColor blackColor];  // changes cursor color
 
        itemField.delegate = self;  //says will be deligate
        
        //        [self.tableView.tableHeaderView addSubview:itemField];
        
        [header addSubview:itemField];
        
        
        //      Buttons
        lowbutton = [[UIButton alloc] initWithFrame:CGRectMake(170, 10, 40, 40)];
        lowbutton.tag = 1;
        lowbutton.backgroundColor = YELLOW_COLOR;
        lowbutton.layer.cornerRadius = 20;
        [lowbutton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [lowbutton setTitle:@"L" forState:UIControlStateNormal];
        [header addSubview: lowbutton];
        
        
        medbutton = [[UIButton alloc] initWithFrame:CGRectMake(220, 10, 40, 40)];
        medbutton.tag = 2;
        medbutton.backgroundColor = ORANGE_COLOR;
        medbutton.layer.cornerRadius = 20;
        [medbutton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        [medbutton setTitle:@"M" forState:UIControlStateNormal];
        [header addSubview: medbutton];
        
        
        highbutton = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 40 , 40)];
        highbutton.tag = 3;
        highbutton.backgroundColor = RED_COLOR;
        highbutton.layer.cornerRadius = 20;
        [header addSubview: highbutton];
        [highbutton setTitle:@"H" forState:UIControlStateNormal];
        [highbutton addTarget:self action:@selector(addNewListItem:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        //        listItems = [@[]mutableCopy];
        //        self.tableView.contentInset = ui
        
        
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        self.tableView.rowHeight = 50;
        
        
    }
    return self;
}




- (void)newItem

{
    NSString * itemName = itemField.text;
    itemField.text = @"";
    
    [itemField resignFirstResponder];
    
    [listItems insertObject:itemName atIndex:0];
    
    NSLog(@"%@", itemName);
    
    NSLog(@"Clicking");

    [self.tableView reloadData];
}


-(void)deleteItem:(TDLTableViewCell *)cell
{

    NSLog(@"Delete");

    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    [listItems removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}




-(void)setItemPriority:(int)priority withItem:(TDLTableViewCell *)cell
{

    NSLog(@"Priority : %d", priority);

    NSIndexPath * indexPath = [self.tableView indexPathForCell:cell];
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    NSDictionary * updateListItem = @{
                                      @"name" : listItem[@"name"],
                                      @"priority" : @(priority),
                                      @"constant" : @(priority)
                                      };

    [listItems removeObjectAtIndex:indexPath.row];
    [listItems insertObject:updateListItem atIndex:indexPath.row];

    cell.bgView.backgroundColor = priorityColors [priority];
 
    [MOVE animateView:cell.bgView properties:@{@"x":@10,@"duration":@0.5}];
    [cell hideCircleButtons];
    cell.swiped = NO;
    
}




- (BOOL) textFieldShouldReturn:(UITextField *) textfield

{
//    [self newItem];

    [textfield resignFirstResponder];
    
    return YES;
    
}




- (void)addNewListItem: (id)sender
{
    UIButton * button = (UIButton *)sender;
    
    NSString * name = itemField.text;
    //    NSInteger * priority = button.tag;
    //    if ([sender isEqual:highbutton]) NSLog(@"highButton");
    
    itemField.text = @"";
    if(![name isEqualToString:@""])
        
    {
        [listItems insertObject:@{@"name" :name,@"priority" : @(button.tag), @"constant" : @(button.tag)} atIndex:0];
    }
    
    NSLog(@"%@", sender);
    
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
    
    [cell resetLayout];  // calls the resetLayout method from tableviewcell.m
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.delegate = self;
    
    NSDictionary * listItem = listItems[indexPath.row];

    
// sets button's background color from the color array above.  
    cell.bgView.backgroundColor = priorityColors[[listItem[@"priority"] intValue]];
    
    
    if([listItem[@"priority"] intValue] == 0)
    {
        
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
        
    } else {
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
        
    }
    
    cell.nameLabel.text = listItem[@"name"];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCell:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [cell addGestureRecognizer:swipeRight];
    
    
    
    return cell;
    
    //    cell.textLabel.textColor = [UIColor whiteColor];  // cell text color
    //    NSLog(@"%@",listItems[indexPath.row]);
    //    cell.textLabel.text = listItems[indexPath.row];
    
}








//  Styles for Cells
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath { cell.backgroundColor = [UIColor redColor]; }

// Base on Priority Selected





- (NSDictionary *)getListItem:(NSInteger)row
{
    NSArray * reverseArray = [[listItems reverseObjectEnumerator] allObjects];
    return reverseArray[row];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    // get cell from tableview at row
    TDLTableViewCell *cell = (TDLTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    // if cell state "swiped" is true : stop (this will be set in the swipe gesture method)
    if(cell.swiped) return;
    
    
    /// if() is true.... return;  return stops the function
    
    
    NSDictionary * listItem = listItems[indexPath.row];
    
    
    // create new dictionary with done priority
    //    NSDictionary * updateListItem = @{@"name": listItems[indexPath.row][@"name"],
    //                                      @"priority": @0
    //                                     };
    
    // if position is to the left then stop
    //    if (cell.bgView.frame.origin.x < 0) {
    //        return;
    //    }
    
    
    // remove old dictionary for cell
    
    // add new dictionary for cell
    
    
    //    TJ's Unclick / Unstrike Solution
    
    
    NSDictionary * updateListItem = listItem;
    
    
    if ([listItem[@"priority"] intValue])
    {
        cell.bgView.backgroundColor = priorityColors[0];
        cell.strikeThrough.alpha = 1;
        cell.circleButton.alpha = 0;
        updateListItem = @{@"name": listItem[@"name"], @"priority": @0, @"constant" : listItem[@"constant"]};
        
    }
    else
    {
        cell.bgView.backgroundColor = priorityColors[[listItem[@"constant"] intValue]];
        cell.strikeThrough.alpha = 0;
        cell.circleButton.alpha = 1;
        updateListItem = @{@"name": listItem[@"name"], @"priority": listItem[@"constant"], @"constant" : listItem[@"constant"]};
    }
    
    [listItems removeObjectAtIndex:indexPath.row];
    [listItems insertObject:updateListItem atIndex:indexPath.row];
    
    
}





- (void)swipeCell:(UISwipeGestureRecognizer *)gesture
{
    
    //    NSLog(@"%@"), gesture;
    
    TDLTableViewCell * cell = (TDLTableViewCell *)gesture.view;
    
// gesture.direction == left :2
// gesture.direction == right : 1
// if gesture.direction == left && priority = 0 : 12  (Switch must use a number)
// if gesutre.direction == right && priority = 1 : 11 (Switch must use a number)
    
    
    
    
    //    NSInteger index = [self.tableView indexPathForCell:cell].row;
    

    NSInteger index = [self.tableView indexPathForCell:cell].row;
    NSDictionary * listItem = listItems[index];
    
    int completed;
    
    completed = ([listItem[@"priority"] intValue] == 0) ? 10 :0;     // same as code block below

//    int completed;
//
//    if([listItem[@"priority"] intValue] == 0)
//    {
//        completed = 1;
//    } else {
//        completed = 0;
//    }
    
        
        
        
        
                      
    switch (gesture.direction + completed)
    {
        case 1:  // right
            NSLog(@"swiping right");
            cell.swiped = NO;
            [MOVE animateView:cell.bgView properties:@{@"x" : @10,@"duration" : @0.5}];
            [cell hideCircleButtons];
            break;
            
        case 2:  // left
            NSLog(@"swiping left");
            cell.swiped = YES;
            [MOVE animateView:cell.bgView properties:@{@"x" : @-140,@"duration" : @0.5}];
            [cell showCircleButtons];
            break;

        case 11:  // right
//            NSLog(@"swiping right");
            cell.swiped = NO;
            [MOVE animateView:cell.bgView properties:@{@"x" : @10,@"duration" : @0.5}];
           [cell hideDeleteButton];
            break;
            
        case 12:  // left
//            NSLog(@"swiping left");
            cell.swiped = YES;
            [MOVE animateView:cell.bgView properties:@{@"x" : @-40,@"duration" : @0.5}];
            [cell showDeleteButton];
            break;

            
            
            
            
            
            
        default:
            break;
    }
    
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
