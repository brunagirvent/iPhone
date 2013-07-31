//
//  VideoDetailViewController.h
//  TSCTerrassa
//
//  Created by Skiria on 11/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

#import <UIKit/UIKit.h>
//Import de MediaPlayer Framework
#import <MediaPlayer/MediaPlayer.h>

//Import Video class
@class Video;

@interface VideoDetailViewController : UIViewController {
	
	//IBOutlet to connect to tableView on 
	IBOutlet UITableView *tableView;
	IBOutlet UIImageView *imageView;
	
	//Video ivar to allocate video info
	Video *aVideo;
}

//define setters and getters
@property (nonatomic, retain)Video *aVideo;

//action to plays video when press the button
-(IBAction)playVideo:(id)sender;

@end
