//
//  Video.h
//  TSCTerrassa
//
//  Created by Skiria on 04/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

/*
 This class defines all the parameters of the video metadata. 
 This parameters will be write on this varaibales when the
 XML file is parsed and will be show on the video detail view. 
 The class contains the name, id, description, user, topic and category. 
 It also contains a urlTHumbnail to show a thumbnail on the video detail view
 and a urlVideo to play it. 
 */
 
 
 
#import <UIKit/UIKit.h>


@interface Video : NSObject {

	NSInteger videoID; 
	NSString *nameVideo;
	NSString *nameCategory; 
	NSString *nameTopic; 
	NSString *user;
	NSString *date; 
	NSString *description; 
	NSString *urlThumbnail;
	NSString *urlVideo;
}

//Defines setters and getters methods
@property (nonatomic, readwrite) NSInteger videoID; 
@property (nonatomic, retain) NSString *nameVideo;
@property (nonatomic, retain) NSString *nameCategory; 
@property (nonatomic, retain) NSString *nameTopic; 
@property (nonatomic, retain) NSString *user; 
@property (nonatomic, retain) NSString *date; 
@property (nonatomic, retain) NSString *description; 
@property (nonatomic, retain) NSString *urlThumbnail; 
@property (nonatomic, retain) NSString *urlVideo; 
 

@end
