//
//  navegaTableViewController.h
//  TSCTerrassa
//
//  Created by Skiria on 05/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

 /*
 This file controlls the tableview of Videos Section
 It uses categories array to show the categories, topics and name's video
 on a arrays hierachy
 When user selects a video it load a VideoDetailView with video's metadata information
 */

//Import classes
#import <UIKit/UIKit.h>
#import "Category.h"
#import "Topic.h"
#import "Video.h"

@class NavegaNavController, TSCTerrassaAppDelegate, VideoDetailViewController; 



@interface navegaTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
	//Delegate from appDetelegate
	TSCTerrassaAppDelegate *appDelegate;
	
	//iVar linked to tableview from IB to dispaly the content on the table
	IBOutlet UITableView *navegaTableView;
	
	//iVar that controls the DetailView
	VideoDetailViewController *videoDVController;
	
	
	//iVars to safe the data and display on the tableview
	NSArray *tableDataSource; //data to display on the tableview
	NSString *CurrentTitle; //title of the actual data to display on the tableview
	NSInteger CurrentLevel; //level of the tableview (0, 1 or 2)
	
	//iVar to show chose category and topic on title view
	//NSString *CurrentCategoryView;
	//NSString *CurrentTopicView;
}

//Definition of setters and getters for the ivars
@property (nonatomic, retain) VideoDetailViewController *videoDVController;
@property (nonatomic, retain) NSArray *tableDataSource;
@property (nonatomic, readwrite) NSInteger CurrentLevel;
@property (nonatomic, retain) NSString *CurrentTitle; 

//@property (nonatomic, retain) NSString *CurrentCategoryView;
//@property (nonatomic, retain) NSString *CurrentTopicView;


@end
