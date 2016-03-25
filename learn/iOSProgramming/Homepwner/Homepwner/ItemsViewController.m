//
//  ItemsViewController.m
//  Homepwner
//
//  Created by liupeng on 16/3/24.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	CGFloat statusBarHeight	= [[UIApplication sharedApplication] statusBarFrame].size.height;
	UIEdgeInsets insets = UIEdgeInsetsMake(statusBarHeight, 0, 0, 0);
	self.tableView.contentInset	= insets;
	self.tableView.scrollIndicatorInsets = insets;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.itemStore.allItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
	
    // Configure the cell...
	Item *item = [self.itemStore.allItems objectAtIndex:indexPath.row];
	cell.textLabel.text	= item.name;
	cell.detailTextLabel.text	= [NSString stringWithFormat:@"%ld", (long)item.valueInDollars];
	
    return cell;
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
		Item *deleteItem = [self.itemStore.allItems objectAtIndex:indexPath.row];
		NSString *title = [[NSString alloc] initWithFormat:@"Delete %@", deleteItem.name];
		NSString *msg = @"Are you sure want to delete this item?";
		UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
		[ac addAction:cancelAction];
		UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
			// Delete the row from the data source
			[self.itemStore removeItem:deleteItem];
			[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		}];
		[ac addAction:deleteAction];
		[self presentViewController:ac animated:YES completion:nil];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	[self.itemStore moveItemAtIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toggleEditingMode:(id)sender {
	UIButton *editButton = (UIButton *)sender;
	if (self.editing) {
		[editButton setTitle:@"Edit" forState:UIControlStateNormal];
		[self setEditing:false animated:true];
	} else {
		[editButton setTitle:@"Done" forState:UIControlStateNormal];
		[self setEditing:true animated:true];
	}
}

- (IBAction)addNewItem:(id)sender {
	Item *newItem = [self.itemStore createItem];
	NSInteger index = 0;
	if ((index = [self.itemStore.allItems indexOfObject:newItem]) != NSNotFound) {
		NSIndexPath *indexPath	= [NSIndexPath indexPathForRow:index inSection:0];
		[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	}
}
@end
