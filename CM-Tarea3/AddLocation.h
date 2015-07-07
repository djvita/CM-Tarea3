//
//  AddLocation.h
//  CM-Tarea3
//
//  Created by Elias Vltaliano Vidaurre Davila on 7/5/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@import GoogleMaps;

@interface AddLocation : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtFName;
@property (strong, nonatomic) IBOutlet UITextField *txtFDesc;
@property (strong, nonatomic) IBOutlet UITextField *txtFLat;
@property (strong, nonatomic) IBOutlet UITextField *txtFLong;

@property (strong, nonatomic)   CLLocationManager   *locationManager;

- (IBAction)btnBackPressed:(id)sender;
- (IBAction)btnSavePressed:(id)sender;
- (IBAction)btnCurrentLocPressed:(id)sender;

@end
