//
//  Video.m
//  TSCTerrassa
//
//  Created by Skiria on 04/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import "Video.h"

@implementation Video

//Implements setters and getters methods
@synthesize videoID, nameVideo, nameCategory, nameTopic, user, date, description, urlThumbnail, urlVideo;

//Release memory and destruct the Video class
- (void)dealloc {
	//Release memory
	[nameVideo release];
	[nameCategory release];
	[nameTopic release];
	[user release];
	[date release];
	[description release];
	[urlThumbnail release];
	[urlVideo release];
	
	//Destruct the class
    [super dealloc];
}


@end
