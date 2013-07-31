//
//  VideoDetailViewController.m
//  TSCTerrassa
//
//  Created by Skiria on 11/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import "VideoDetailViewController.h"
#import "Video.h"


@implementation VideoDetailViewController

//Implement setters and getters
@synthesize aVideo;


//Play the video from server
- (IBAction)playVideo:(id)sender;
{
	//copy url from video
	NSURL *url = [NSURL URLWithString: aVideo.urlVideo];

	//Play video from url
	MPMoviePlayerController *VideoPlayer = [[MPMoviePlayerController alloc]initWithContentURL: url];
	[VideoPlayer play];	
	
	//release memory
	[url release];
	
}


//
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.navigationItem.title = aVideo.nameVideo;

	[tableView reloadData];
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//NSLog(@"URLTHUMBNAIL: %@", aVideo.urlThumbnail);
	NSURL *imageURL = [NSURL  URLWithString: aVideo.urlThumbnail];
	NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
	UIImage *image = [UIImage imageWithData:imageData];	
	imageView.image = image;
	
	
}


//Orientation of the view
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//Customize number of sections in tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

//Customize number of rows in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

//Customize text cells rows with video's metadata information
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
	
	//Text on tableview cells
	switch(indexPath.section)
	{
		case 0:
			cell.text = aVideo.nameVideo;
			break;
		case 1:
			cell.text = aVideo.description;
			break;
		case 2:
			cell.text = aVideo.date;
			break;
		case 3:
			cell.text = aVideo.user;
			break;
		case 4:
			cell.text = aVideo.nameTopic;
			break;
		case 5:
			cell.text = aVideo.nameCategory;
			break;
	}
	
	return cell;
}

//Customize name sections
- (NSString *)tableView:(UITableView *)tblView titleForHeaderInSection:(NSInteger)section {
	
	NSString *sectionName = nil;
	
	//Name of each section
	switch(section)
	{
		case 0:
			sectionName = [NSString stringWithString:@"Title"];
			break;
		case 1:
			sectionName = [NSString stringWithString:@"Description"];
			break;
		case 2:
			sectionName = [NSString stringWithString:@"Date"];
			break;
		case 3:
			sectionName = [NSString stringWithString:@"User"];
			break;
		case 4:
			sectionName = [NSString stringWithString:@"Topic"];
			break;
		case 5:
			sectionName = [NSString stringWithString:@"Category"];
	}
	
	return sectionName;
}

	
- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[tableView release];
	[aVideo release];
	[imageView release];
    [super dealloc];
}


@end
