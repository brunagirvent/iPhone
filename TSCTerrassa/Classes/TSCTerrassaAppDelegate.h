//
//  TSCTerrassaAppDelegate.h
//  TSCTerrassa
//
//  Created by Skiria on 03/05/10.
//  Copyright UPC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavegaNavController;

@interface TSCTerrassaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	IBOutlet UITabBarController *rootController; 
	IBOutlet NavegaNavController *navegaNavController; 
	
	NSMutableArray *categories; 
}

//Implement setters and getters
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController; 
@property (nonatomic, retain) IBOutlet NavegaNavController *navegaNavController; 

@property (nonatomic, retain) NSMutableArray *categories; 

@end

