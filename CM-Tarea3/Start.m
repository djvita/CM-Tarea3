//
//  ViewController.m
//  CM-Tarea3
//
//  Created by Elias Vltaliano Vidaurre Davila on 7/5/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Start.h"
#import "Declarations.h"
#import "AddLocation.h"
#import "cellMaps.h"
#import "Details.h"
#import <Google/Analytics.h>
@import GoogleMaps;

#define         nLocalizing     0
#define         nLocalized      1

//Localization
float                   mlatitude;
float                   mlongitude;
static int              iLocalizeState = nLocalizing;

@interface Start ()

@end


@implementation Start{
    GMSMapView          *mapView;
    GMSMarker           *markerLocation;
    GMSCameraPosition   *camera;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Location
    
    self.locationManager                    = [[CLLocationManager alloc] init];
    self.locationManager.delegate           = self;
    self.location                           = [[CLLocation alloc] init];
    self.locationManager.desiredAccuracy    = kCLLocationAccuracyBest;
    [self.locationManager  requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];

    [self paintMap];
    
    [self initController];
    
    [self paintMarker];

    //[self locationManager];
    
    _tabla.hidden = YES;
    _view1.hidden = NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated // new
{
    
    [super viewWillAppear:animated];
    
    [self.tabla reloadData];
    //google analytics
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"CM-Tarea3-Start"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

-(void)initController {
    maNames = [[NSMutableArray alloc] initWithObjects:
               @"Plaza Andares",
               @"Plaza Patria",
               @"Gran Plaza",
               @"Plaza del Sol",
               nil
               ];
    
    maDesc = [[NSMutableArray alloc] initWithObjects:
              @"Mas Exclusiva",
              @"Mas Economica",
              @"Mas Grande",
              @"Primera",
              nil
              ];
    
    maLat = [[NSMutableArray alloc] initWithObjects:
             @"20.7101184",
             @"20.7123263",
             @"20.6736248",
             @"20.6493428",
             nil
             ];
    
    maLong = [[NSMutableArray alloc] initWithObjects:
              @"-103.4127531",
              @"-103.3784522",
              @"-103.4048358",
              @"-103.4023513",
              nil
              ];
    

}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maDesc.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//TABLE METHODS-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellMaps *cell = (cellMaps *)[tableView dequeueReusableCellWithIdentifier:@"cellMaps"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMaps" bundle:nil] forCellReuseIdentifier:@"cellMaps"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMaps"];
    }
    //Fill cell with info from arrays
    cell.lblName.text    =  maNames[indexPath.row];
    cell.lblDesc.text    =  maDesc[indexPath.row];
    cell.lblLat.text     =  maLat[indexPath.row];
    cell.lblLong.text    =  maLong[indexPath.row];
    
    
    cell.clipsToBounds  = YES;
    [cell.contentView.superview setClipsToBounds:YES];
    
    
    return cell;

    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miLocatiuonIndex = (int)indexPath.row;
    Details *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Details"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}


- (IBAction)btnAddPressed:(id)sender {
    AddLocation *addLoc= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddLocation"];
    
    [self presentViewController:addLoc animated:YES completion:nil];

}

- (IBAction)changeSegment:(id)sender {
    if(_segMaps.selectedSegmentIndex == 0)
    {
        // show map reload table to paint new marker
        _tabla.hidden = YES;
        _view1.hidden = NO;
        [self.tabla reloadData];
        [self paintMap];
        [self paintMarker];
    }
    else if (_segMaps.selectedSegmentIndex == 1)
    {
        // show list
        _tabla.hidden = NO;
        _view1.hidden = YES;
        [self.tabla reloadData];
    }
    
    [_tabla reloadData];
}

/**********************************************************************************************/
#pragma mark - Maps methods
/**********************************************************************************************/
- (void) paintMap {
    [mapView removeFromSuperview];
    camera                      = [GMSCameraPosition cameraWithLatitude:mlatitude longitude:mlongitude zoom:10.0];
    mapView                     = [GMSMapView mapWithFrame:self.view1.bounds camera: camera];
    mapView.frame               = CGRectMake(0, 60, self.view1.frame.size.width, self.view1.frame.size.height-60);
    mapView.myLocationEnabled   = YES;
    
    [self.view1 addSubview: mapView];

}
//------------------------------------------------------------
- (void) paintMarker {
    [self.tabla reloadData];
    GMSMarker *marker       = [[GMSMarker alloc] init];
    marker.position         = camera.target;
    marker.title            = @"Ahora";
    marker.snippet          = @"Estas Aqui";
    marker.appearAnimation  = kGMSMarkerAnimationPop;
    marker.map = mapView;
    
    CLLocationCoordinate2D position;
    NSLog(@"maPlacesTitle.count %d", (int)maNames.count);
    for (int i = 0; i<maNames.count; i++)
    {
        CGFloat lat                     = (CGFloat)[maLat[i] floatValue];
        CGFloat lng                     = (CGFloat)[maLong[i] floatValue];
        NSLog(@"Marker lat %f, long %f", lat, lng);
        position                        = CLLocationCoordinate2DMake(lat, lng);
        markerLocation                  = [GMSMarker markerWithPosition:position];
        markerLocation.icon             = [GMSMarker markerImageWithColor:[UIColor blueColor]];
        markerLocation.title            = maNames[i];
        markerLocation.snippet          = maDesc[i];
        markerLocation.appearAnimation  = kGMSMarkerAnimationPop;
        markerLocation.map              = mapView;
    }
}
/**********************************************************************************************/
#pragma mark - Localization
/**********************************************************************************************/
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.location = locations.lastObject;
    NSLog(@"didUpdateLocation!");
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *placemark in placemarks) {
            NSString *addressName = [placemark name];
            NSString *city = [placemark locality];
            NSString *administrativeArea = [placemark administrativeArea];
            NSString *country  = [placemark country];
            NSString *countryCode = [placemark ISOcountryCode];
            //NSLog(@"name is %@ and locality is %@ and administrative area is %@ and country is %@ and country code %@", addressName, city, administrativeArea, country, countryCode);

        }
        
        mlatitude = self.locationManager.location.coordinate.latitude;
        mlongitude = self.locationManager.location.coordinate.longitude;
        NSLog(@"mlatitude = %f", mlatitude);
        NSLog(@"mlongitude = %f", mlongitude);
        if (iLocalizeState == nLocalizing) {
            [self paintMap];
            [self paintMarker];
            iLocalizeState = nLocalized;
        }
    }];
    
}


@end
