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
    
    //save the NSArray to disk to reuse
    //Creating a file path under iOS:
    //Search for the app's documents directory (copy+paste from Documentation)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    // Create the full file path by appending the desired file name
    
    
    NSString *arrayFilemaNames = [documentsDirectory stringByAppendingPathComponent:@"maNames.dat"];
    //NSMutableArray *maNames = [[NSMutableArray alloc] initWithContentsOfFile: arrayFilemaNames];
    [maNames writeToFile:arrayFilemaNames atomically:YES];
    

    NSString *arrayFilemaDesc = [documentsDirectory stringByAppendingPathComponent:@"maDesc.dat"];
    //NSMutableArray *yourArray = [[NSMutableArray alloc] initWithContentsOfFile: yourArrayFileName];
    [maDesc writeToFile:arrayFilemaDesc atomically:YES];
    

    NSString *arrayFilemaLat = [documentsDirectory stringByAppendingPathComponent:@"maLat.dat"];
    //NSMutableArray *yourArray = [[NSMutableArray alloc] initWithContentsOfFile: yourArrayFileName];
    [maLat writeToFile:arrayFilemaLat atomically:YES];
    
    
    NSString *arrayFilemaLong = [documentsDirectory stringByAppendingPathComponent:@"maLong.dat"];
    //NSMutableArray *yourArray = [[NSMutableArray alloc] initWithContentsOfFile: yourArrayFileName];
    [maLong writeToFile:arrayFilemaLong atomically:YES];

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
