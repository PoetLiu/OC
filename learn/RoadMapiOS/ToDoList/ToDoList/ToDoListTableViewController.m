//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by liupeng on 16/3/9.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;
@property NSDateFormatter *dateFormatter;

@end

@implementation ToDoListTableViewController
{
	NSString *paramFile;
}

- (IBAction)editButtonAction:(id)sender {
	[self setEditing:![super isEditing] animated:YES];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
	AddToDoItemViewController *source = [segue sourceViewController];
	ToDoItem *item	= source.toDoItem;
	if (item != nil) {
		[self.toDoItems addObject:item];
		[self saveParam];
		[self.tableView reloadData];
	}
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];
	[self.tableView setEditing:editing animated:animated];
	self.addButtonItem.enabled	= !editing;
}

- (BOOL) loadParam {
	if (!paramFile) {
		NSArray *documentPaths	= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		paramFile	= [[NSString alloc] initWithFormat:@"%@/%@", documentPaths[0], @"text"];
	}
    NSLog(@"%@", paramFile);
	
    NSDictionary *param = [NSKeyedUnarchiver unarchiveObjectWithFile:paramFile];
    self.toDoItems  = [param objectForKey:@"toDoItems"];
    self.dateFormatter  = [param objectForKey:@"dateFormatter"];
    return (self.toDoItems != nil && self.dateFormatter != nil);
}

- (void) saveParam {
	NSDictionary *param  = [[NSDictionary alloc] initWithObjectsAndKeys:self.toDoItems, @"toDoItems", self.dateFormatter, @"dateFormatter", nil];
	[NSKeyedArchiver archiveRootObject:param toFile:paramFile];
}

- (void) loadInitialData {
	if (![self loadParam]) {
		NSLog(@"faild to load param");
		self.toDoItems	= [[NSMutableArray alloc] init];
		ToDoItem *item1 = [[ToDoItem alloc] init];
		item1.itemName	= @"Buy milk";
		item1.imgName	= @"0";
		[self.toDoItems addObject:item1];
		
		ToDoItem *item2 = [[ToDoItem alloc] init];
		item2.itemName	= @"Buy eggs";
		item2.imgName	= @"1";
		[self.toDoItems addObject:item2];
		
		ToDoItem *item3 = [[ToDoItem alloc] init];
		item3.itemName	= @"Read a book";
		item3.imgName	= @"2";
		[self.toDoItems addObject:item3];
        self.dateFormatter  = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"hh:mm:ss"];
	}
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableViewCell:(UITableViewCell *)cell dataItem:(ToDoItem *)item {
    cell.textLabel.text	= item.itemName;
	cell.detailTextLabel.text	= [self.dateFormatter stringFromDate:item.creationDate];
	cell.imageView.image	= [UIImage imageNamed:item.imgName];
	
    if (item.completed) {
        cell.accessoryType	= UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType	= UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
	ToDoItem *toDoItem	= [self.toDoItems objectAtIndex:indexPath.row];
    return [self tableViewCell:cell dataItem:toDoItem];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
		[self.toDoItems removeObjectAtIndex:indexPath.row];
		[self saveParam];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	ToDoItem *fromItem = [self.toDoItems objectAtIndex:fromIndexPath.row];
	ToDoItem *toItem = [self.toDoItems objectAtIndex:toIndexPath.row];
	[self.toDoItems replaceObjectAtIndex:toIndexPath.row withObject:fromItem];
	[self.toDoItems replaceObjectAtIndex:fromIndexPath.row withObject:toItem];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
	ToDoItem *tappedItem	= [self.toDoItems objectAtIndex:indexPath.row];
	tappedItem.completed	= !tappedItem.completed;
	[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (IBAction)editButton:(id)sender {
}
@end
