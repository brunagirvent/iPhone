//
//  Topic.m
//  TSCTerrassa
//
//  Created by Skiria on 04/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import "Topic.h"
#import "Video.h"


@implementation Topic

@synthesize videos, nameTopic, topicID; 


- (void)dealloc {
	[nameTopic release];
	[videos release];
    [super dealloc];
}


@end
