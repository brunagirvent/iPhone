//
//  TSCTerrassaAppDelegate.m
//  TSCTerrassa
//
//  Created by Skiria on 03/05/10.
//  Copyright UPC 2010. All rights reserved.
//

#import "TSCTerrassaAppDelegate.h"
#import "XMLParser.h"
#import "NavegaNavController.h"
#import "Video.h"
#import "Category.h"

@implementation TSCTerrassaAppDelegate

@synthesize window;
@synthesize rootController; 
@synthesize navegaNavController; 

@synthesize categories; 

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	
	//URL of XML file
	NSURL *url = [[NSURL alloc] initWithString:@"http://147.83.74.180/iPhone/metadata.xml"];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	
	//Start parser
	XMLParser *parser = [[XMLParser alloc] initXMLParser];
	[xmlParser setDelegate:parser];
	
	//Start parsing the XML file.
	BOOL success = [xmlParser parse];
	
	if(success){
		NSLog(@"No Errors");
	}
	else
		NSLog(@"Error Parsing the XML File");
	

	
    // Override point for customization after application launch
	[window addSubview:rootController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[navegaNavController release];
	[categories release];
	[rootController release];
    [window release];
    [super dealloc];
}


@end
