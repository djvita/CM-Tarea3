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

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    
    // Do any additional setup after loading the view, typically from a nib.
    _tabla.hidden = YES;
    _view1.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tabla reloadData];
    
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
//-------------------------------------------------------------------------------
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
        _tabla.hidden = YES;
        _view1.hidden = NO;
    }
    else if (_segMaps.selectedSegmentIndex == 1)
    {
        _tabla.hidden = NO;
        _view1.hidden = YES;
    }
    
    [_tabla reloadData];
}
@end
