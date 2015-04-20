//
//  PhotoTableViewController.m
//  TableViewWithSearchBar
//
//  Created by Dream 71 on 3/24/15.
//  Copyright (c) 2015 Dream 71. All rights reserved.
//

#import "PhotoTableViewController.h"

@interface PhotoTableViewController () {
    NSArray *photos;
    NSArray *searchResults;
}

@end

@implementation PhotoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Photo *pic1 = [Photo new];
    pic1.name = @"Cox's Bazar";
    
    Photo *pic2 = [Photo new];
    pic2.name = @"Saint Martin's Island";
    
    Photo *pic3 = [Photo new];
    pic3.name = @"Kuakata Beach";
    
    Photo *pic4 = [Photo new];
    pic4.name = @"Bandarban";
    
    Photo *pic5 = [Photo new];
    pic5.name = @"Rangamati";
    
    Photo *pic6 = [Photo new];
    pic6.name = @"Sunderban";
    
    Photo *pic7 = [Photo new];
    pic7.name = @"Jaflong";
    
    Photo *pic8 = [Photo new];
    pic8.name = @"Ratargul Swamp Forest";
    
    Photo *pic9 = [Photo new];
    pic9.name = @"National Parliament";
    
    Photo *pic10 = [Photo new];
    pic10.name = @"Jatiyo Smriti Soudho";
    
    Photo *pic11 = [Photo new];
    pic11.name = @"Shaheed Minar";
    
    photos = [NSArray arrayWithObjects:pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, pic11, nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [photos count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    Photo *recipe = nil;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        recipe = [searchResults objectAtIndex:indexPath.row];
    } else {
        recipe = [photos objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = [recipe name];
    
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];
    searchResults = [photos filteredArrayUsingPredicate:resultPredicate];
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    //[messageAlert show];

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
