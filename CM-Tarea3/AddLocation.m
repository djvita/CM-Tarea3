//
//  AddLocation.m
//  CM-Tarea3
//
//  Created by Elias Vltaliano Vidaurre Davila on 7/5/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "AddLocation.h"
#import "Declarations.h"
#import <CoreLocation/CoreLocation.h>
@import GoogleMaps;

//Localization
float                   flatitude;
float                   flongitude;

@interface AddLocation ()

@end

@implementation AddLocation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //keyboard dismiss
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

    //google maps
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [self.locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//dismiss keyboard
-(void)dismissKeyboard {
    [_txtFName resignFirstResponder];
    [_txtFDesc resignFirstResponder];
    [_txtFLat resignFirstResponder];
    [_txtFLong resignFirstResponder];
}

- (IBAction)btnBackPressed:(id)sender {
    [_txtFName resignFirstResponder];
    [_txtFDesc resignFirstResponder];
    [_txtFLat resignFirstResponder];
    [_txtFLong resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)btnSavePressed:(id)sender {
    [_txtFName resignFirstResponder];
    [_txtFDesc resignFirstResponder];
    [_txtFLat resignFirstResponder];
    [_txtFLong resignFirstResponder];
    //populate to the externs
    [maNames addObject:self.txtFName.text];
    [maDesc addObject:self.txtFDesc.text];
    [maLat addObject:self.txtFLat.text];
    [maLong addObject:self.txtFLong.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)btnCurrentLocPressed:(id)sender {
    flatitude = self.locationManager.location.coordinate.latitude;
    flongitude = self.locationManager.location.coordinate.longitude;
    NSLog(@"flatitude = %f", flatitude);
    NSLog(@"flongitude = %f", flongitude);
    NSString *sLatitude = [NSString stringWithFormat:@"%1.6f", flatitude];
    NSString *sLongitude= [NSString stringWithFormat:@"%1.6f", flongitude];
    _txtFLat.text = sLatitude;
    _txtFLong.text = sLongitude;
}
@end
