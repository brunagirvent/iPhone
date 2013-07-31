//
//  Topic.h
//  TSCTerrassa
//
//  Created by Skiria on 04/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

/* 
 This class defines the Topics. It contains a array of videos
 for each topic, the name of the topic and this identifier. 
 */
 
#import <UIKit/UIKit.h>

@class Video; 


@interface Topic : NSObject {
	NSMutableString *nameTopic; 
	NSInteger topicID; 
	NSMutableArray *videos; //array for each category
}

//Defines of setters and getters
@property (nonatomic, readwrite) NSInteger topicID;
@property (nonatomic, retain) NSMutableArray *videos; 
@property (nonatomic, retain) NSMutableString *nameTopic; 

@end
