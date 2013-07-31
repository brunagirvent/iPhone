//
//  IniciController.m
//  TSCTerrassa
//
//  Created by Skiria on 03/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import "IniciController.h"


@implementation IniciController

//Actions to open webs on Safari
- (IBAction) OpenBitSearch {
	//Open url on Safari
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://bitsearch.blogspot.com/"]];
}

- (IBAction) OpenWebTSC {
	//Open url on Safari
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.tsc.upc.edu"]];
}

- (IBAction) OpenWebMoodleTSC {
	//Open url on Safari
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://terrassatsc.upc.edu"]];
}


- (IBAction) OpenWebEET {
	//Open url on Safari
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.eet.upc.edu/"]];
}

- (IBAction) OpenWebUPC {
	//Open url on Safari

	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.upc.edu"]];
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


//Release memory and dealloc class
- (void)dealloc {
    [super dealloc];
}


@end
