//
//  Details.m
//  CM-Tarea3
//
//  Created by vita on 7/6/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Details.h"
#import "Declarations.h"

@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
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

- (void)initController {
    self.lblName.text   =  maNames[miLocatiuonIndex];
    self.lblDesc.text   =  maDesc[miLocatiuonIndex];
    self.lblLat.text    =  maLat[miLocatiuonIndex];
    self.lblLong.text   =  maLong[miLocatiuonIndex];
    
}

- (IBAction)btnBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
