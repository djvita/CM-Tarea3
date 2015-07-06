//
//  Details.h
//  CM-Tarea3
//
//  Created by vita on 7/6/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Details : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblLat;
@property (strong, nonatomic) IBOutlet UILabel *lblLong;
- (IBAction)btnBackPressed:(id)sender;

@end
