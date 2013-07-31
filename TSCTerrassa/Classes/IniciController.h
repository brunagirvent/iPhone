//
//  IniciController.h
//  TSCTerrassa
//
//  Created by Skiria on 03/05/10.
//  Copyright 2010 UPC. All rights reserved.
//

/*
 This file controlls the first view of the app called Inici 
 It implements actions to open UPC webs on Safari. 
*/

#import <UIKit/UIKit.h>


@interface IniciController : UIViewController {
}

//Actions to open webs on Safari
//This actions will be connect on IB with PushButtons
- (IBAction) OpenBitSearch; //www.bitserach.blogspot.com

- (IBAction) OpenWebTSC; //www.tsc.upc.edu

- (IBAction) OpenWebMoodleTSC; //www.terrassatsc.upc.edu

- (IBAction) OpenWebEET; //www.eet.upc.edu

- (IBAction) OpenWebUPC; //www.upc.edu


@end
