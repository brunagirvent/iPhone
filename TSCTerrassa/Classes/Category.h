//
//  Category.h
//  TSCTerrassa
//
//  Created by Skiria on 05/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

/*
 Class to defines the Categories. It uses Topic and Video classes
 to allocates for each category, its id and a array of topics. 
 */

#import <UIKit/UIKit.h>

//imports Topic and Video classes
@class Topic, Video; 


@interface Category : NSObject {
	NSMutableString *nameCategory; 
	NSInteger categoryID; 
	NSMutableArray *topics; //array of topics for each category
}

//Definition set and get methods
@property (nonatomic, retain) NSMutableArray *topics;
@property (nonatomic, readwrite) NSInteger categoryID; 
@property (nonatomic, retain) NSMutableString *nameCategory;


@end
