//
//  ViewController.h
//  CM-Tarea3
//
//  Created by Elias Vltaliano Vidaurre Davila on 7/5/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Start : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tabla;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segMaps;

- (IBAction)btnAddPressed:(id)sender;



@end

