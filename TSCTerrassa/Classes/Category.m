//
//  Category.m
//  TSCTerrassa
//
//  Created by Skiria on 05/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import "Category.h"
#import "Topic.h"
#import	"Video.h"


@implementation Category

//Implementation set and get method's
@synthesize topics, nameCategory, categoryID; 

//Release memory and dealloc the class
- (void)dealloc {
	[nameCategory release];
	[topics release];
    [super dealloc];
}


@end
