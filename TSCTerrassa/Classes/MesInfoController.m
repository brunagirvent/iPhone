//
//  MesInfoController.m
//  TSCTerrassa
//
//  Created by Skiria on 03/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import "MesInfoController.h"

@implementation MesInfoController


//Action to open Bitsearch url on Safari
- (IBAction) OpenBitSearch {
	//Open url on Safari
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://bitsearch.blogspot.com/search/label/Bruna/"]];
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

//Dealloc object
- (void)dealloc {
    [super dealloc];
}


@end
