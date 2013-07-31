//
//  XMLParser.m
//  TSCTerrassa
//
//  Created by Skiria on 05/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

//Imports
#import "XMLParser.h"
#import "TSCTerrassaAppDelegate.h"
#import "Video.h"
#import	"Topic.h"
#import "Category.h"


@implementation XMLParser

//Setters and getters implementation
@synthesize currentNameTopic, currentNameCategory; 

//Start parsing
- (XMLParser *) initXMLParser {
	
	[super init];
	
	appDelegate = (TSCTerrassaAppDelegate *) [[UIApplication sharedApplication] delegate];
	
	return self; 
}

//Parse the first element, like <video>
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	
	//If the element parsed is equal to Videos we initialize the array wich will be 
	//allocate all the data <Videos>
	if([elementName isEqualToString:@"Videos"]) {
		//Initialize the array.
		appDelegate.categories = [[NSMutableArray alloc] init];
	}
	
	//If the element parsed is Category we initialize a Category type to allocate
	//the videos and topics of this category. <Category id=23>
	else if ([elementName isEqualToString:@"Category"])
	{
		//Initialize the Category object
		aCategory = [[Category alloc] init];
		
		//Initialize topics array
		aCategory.topics = [[NSMutableArray alloc] init];
		
		//write category id value on cateroyID
		aCategory.categoryID = [[attributeDict objectForKey:@"id"] integerValue];
		
		//Show the reading value on the console
		NSLog(@"Reading id category value: %i", aCategory.categoryID);
		
	}
	
	//Parsing Topic <Topic id=12>
	else if ([elementName isEqualToString:@"Topic"]) {
		//Initialize Topic object
		aTopic = [[Topic alloc] init];
		
		//Initialize array of videos of this topic
		aTopic.videos = [[NSMutableArray alloc] init];
		
		//Write id value
		aTopic.topicID = [[attributeDict objectForKey:@"id"] integerValue];
		
		NSLog(@"Reading id topic value: %i", aTopic.topicID);

	}
	
	//Reading <videos>
	else if ([elementName isEqualToString:@"video"]) {
		//Initialize Video object
		aVideo = [[Video alloc] init];
		
		//Write videoID, nameTopic and nameCategory of the video
		aVideo.videoID = [[attributeDict objectForKey:@"id"] integerValue];
		aVideo.nameTopic = currentNameTopic; 
		aVideo.nameCategory = currentNameCategory; 
		
		NSLog(@"Reading id video value: %i", aVideo.videoID);

	}
		
	NSLog(@"Processing Element: %@", elementName);
}


//Parse the element value, like Courses
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	//If string not contains a wrong value
	if (![string isEqualToString: @"\n"])
	{
		//Create and initialize currentelementvalue if its the first time
		if(!currentElementValue)
			currentElementValue = [[NSMutableString alloc] initWithString:string];
		
		//Write string on the current element value. The current value are released
		//on the next method when it parses the last element
		else
			[currentElementValue appendString:string];
		
		NSLog(@"Processing Value: %@", currentElementValue);
	}
	
}

//Parse the last element, like </videos>
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	
	//It returns if its the last element of the XML call Videos
	if([elementName isEqualToString:@"Videos"]) 
		return; 
	
	//If </Category> has been detected
	if ([elementName isEqualToString:@"Category"]) {
		
		//add the aCategory object on categories array, wich contains all the data of XML
		[appDelegate.categories addObject:aCategory];
		
		//release aCategory object
		[aCategory release];
		 aCategory = nil;
	}
	
	//If </Topic> has been detected
	if ([elementName isEqualToString:@"Topic"]) {
		
		//Add the aTopic object on topics array of aCategory
		[aCategory.topics addObject:aTopic];
	
		//release aTopic
		[aTopic release];
		aTopic = nil;
	}		 
	
	//If </videos> has been detected
	if ([elementName isEqualToString:@"video"]) {
		
		//Add aVidos on vidos array of each Topic
		[aTopic.videos addObject:aVideo];

		//Release memory
		[aVideo release];
		aVideo = nil;
	}
	
	//</nameCategory>
	if ([elementName isEqualToString:@"nameCategory"]) {
		
		//Write currentElementValue, which contains the nameofCategory on aCategory object
		aCategory.nameCategory = currentElementValue; 
		//Write nameCategory on the ivar
		currentNameCategory = currentElementValue; 
	}
	
	//</nameTopic>
	if ([elementName isEqualToString:@"nameTopic"]) {
		aTopic.nameTopic = currentElementValue; 
		currentNameTopic = currentElementValue; 
	}
		
	// write nameVideo, description, user, date, urlVideo... on each variable of aVideo	
	else 
	[aVideo setValue:currentElementValue forKey:elementName];
	
	//Release currentElementValue
	[currentElementValue release];
	currentElementValue = nil;
	
}


//Release objects and dealloc the class
- (void)dealloc {
	[aVideo release];
	[currentElementValue release];
	[currentNameTopic release];
	[currentNameCategory release];
	[aTopic release];
	[aCategory release];
    [super dealloc];
}


@end
