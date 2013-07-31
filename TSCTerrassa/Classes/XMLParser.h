//
//  XMLParser.h
//  TSCTerrassa
//
//  Created by Skiria on 05/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

/*
 Class to parse the XML file. It reads the XML file, allocated on the server
 and build a array wich contains all the data of XML file. 
 
*/
 
 
#import <UIKit/UIKit.h>

//Import Classes
@class TSCTerrassaAppDelegate, Category, Topic, Video; 

//Defining interface
@interface XMLParser : NSObject {

	NSMutableString *currentElementValue; 
	NSMutableString *currentNameCategory; 
	NSMutableString *currentNameTopic; 
	
	TSCTerrassaAppDelegate *appDelegate; 

	Video *aVideo;
	Topic *aTopic; 
	Category *aCategory; 
}

//Setters and getters definition
@property (nonatomic, retain)NSMutableString *currentNameCategory; 
@property (nonatomic, retain) NSMutableString *currentNameTopic;

//Method to initialize to Parsing XML
- (XMLParser *) initXMLParser; 

@end
