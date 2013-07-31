//
//  navegaTableViewController.m
//  TSCTerrassa
//
//  Created by Skiria on 05/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

//Import classes
#import "navegaTableViewController.h"
#import "navegaNavController.h"
#import "Category.h"
#import "Topic.h"
#import "Video.h"
#import	"TSCTerrassaAppDelegate.h"
#import "VideoDetailViewController.h"


@implementation navegaTableViewController

//Implements setters and getters
@synthesize tableDataSource, CurrentTitle, CurrentLevel, videoDVController;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	//
	appDelegate = (TSCTerrassaAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	//First Level of tableview
	if(CurrentLevel == 0) {
		
		//Initialize table data source
		NSArray *tempArray = [[NSArray alloc] init];
		self.tableDataSource = tempArray;
		[tempArray release];
		
		//Copy categories array on tableDataSource
		self.tableDataSource = appDelegate.categories;
		
		//Write title on navigationbar
		self.navigationItem.title = @"Categories";
		CurrentTitle = @"Categories"; 
	}		

	
	else {
		//Write title on navitaionBar
		/*
		if ([self.CurrentTitle isEqualToString:@"Topics"])
			self.navigationItem.title = CurrentCategoryView;
		
		else if ([self.CurrentTitle isEqualToString:@"Videos"])
			self.navigationItem.title = CurrentTopicView;

		
		else */
			self.navigationItem.title = CurrentTitle;

	}
	
}

//Customize the number of sections in tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//one row for each array item
	return [self.tableDataSource count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier]autorelease];
    }

	// Configure the cell.
	
	//First View of TableView: LEvel0 -> Categories
	if ([CurrentTitle isEqualToString: @"Categories"])
	{
		//write name categories on each row
		Category *aCategory = [self.tableDataSource objectAtIndex:indexPath.row];		
		cell.text = aCategory.nameCategory;
		
	}
	
	//Second View of TableView: Level1 -> Topics
	if ([CurrentTitle isEqualToString: @"Topics"])
	{
		
		//write namecategories on each row
		Topic *aTopic = [self.tableDataSource objectAtIndex:indexPath.row];
		cell.text = aTopic.nameTopic; 
		
	}
	
	//Configure accessorytype
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	//Third View of TableView: Level3 -> Videos
	if ([CurrentTitle isEqualToString: @"Videos"]) 
	{
		//wrtie nameVideos on each row
		Video *aVideo = [self.tableDataSource objectAtIndex:indexPath.row];
		cell.text = aVideo.nameVideo; 
				
		//Configure accessorytype
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		
	}
	
	
	
    return cell;
	
		
}

//This method is called when a row is selected
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	//Displays the second view of the tableview with name of topics
	if ([CurrentTitle isEqualToString:@"Categories"])
	{
		Category *aCategory = [self.tableDataSource objectAtIndex:indexPath.row];
		
		//Prepare to tableview.
		navegaTableViewController *nvController = [[navegaTableViewController alloc] initWithNibName:@"navegaTableView" bundle:[NSBundle mainBundle]];
			
		//Increment the Current View
		nvController.CurrentLevel += 1;		

		//Set the title;
		nvController.CurrentTitle = @"Topics"; 
		
		//NameCategory to show on next view title
		//nvController.CurrentCategoryView = aCategory.nameCategory;
		
		//Pass topics to next view
		nvController.tableDataSource = aCategory.topics; 
			
		//Push the new table view on the stack
		[self.navigationController pushViewController:nvController animated:YES];
		
		[nvController release];
		//[aCategory release];
		//aCategory = nil;
		
	}
	
	//Displays the third view of the tableview with name of videos
	else if ([CurrentTitle isEqualToString:@"Topics"]) 
	{
		Topic *aTopic = [self.tableDataSource objectAtIndex:indexPath.row];
		
		
		//NSLog(@"CURRENT TOPIC VIEW %@", nvController.CurrentTopicView);
		
		//Prepare to tableview.
		navegaTableViewController *nvController = [[navegaTableViewController alloc] initWithNibName:@"navegaTableView" bundle:[NSBundle mainBundle]];
		
		//NameTopic to show on next view title
		//nvController.CurrentTopicView = aTopic.nameTopic;

		
		//Increment the Current View
		nvController.CurrentLevel += 1;
		
		//Set the title;
		nvController.CurrentTitle = @"Videos"; 
		
		
		nvController.tableDataSource = aTopic.videos; 
		
		//Push the new table view on the stack
		[self.navigationController pushViewController:nvController animated:YES];

		[nvController release];
	
	}
	
	//Displays a new view with a DetailInfo of the video selected
	else if ([CurrentTitle isEqualToString:@"Videos"])
	{
		//Create and push a new view controller
		
		if(self.videoDVController == nil)
		{
			//alocate and init the videos view controller
			VideoDetailViewController *videoDVController= [[VideoDetailViewController alloc] initWithNibName:@"VideoDetailView" bundle:[NSBundle mainBundle]];
		
				
		    //copy the data on the tableview of the new view
			Video *aVideo = [self.tableDataSource objectAtIndex:indexPath.row];
			
			videoDVController.aVideo = aVideo;
			
			[self.navigationController pushViewController:videoDVController animated:YES];

			[videoDVController release];
			videoDVController = nil;
			
		}
	}
	
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
}


//Release memory to destruct the object class
- (void)dealloc {
	[CurrentTitle release];
	[tableDataSource release];
    [super dealloc];
}


@end

