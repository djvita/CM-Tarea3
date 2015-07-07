//
//  ViewController.h
//  CM-Tarea3
//
//  Created by Elias Vltaliano Vidaurre Davila on 7/5/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@import GoogleMaps;

@interface Start : UIViewController<UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tabla;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segMaps;

@property (strong, nonatomic)   CLLocationManager   *locationManager;
@property (strong, nonatomic)   CLLocation          *location;

//@property (strong, nonatomic) IBOutlet GMSMapView *mapView_;

- (IBAction)btnAddPressed:(id)sender;

- (IBAction)changeSegment:(id)sender;


@end

