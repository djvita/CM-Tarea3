//
//  AddLocation.m
//  CM-Tarea3
//
//  Created by Elias Vltaliano Vidaurre Davila on 7/5/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "AddLocation.h"
#import "Declarations.h"
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
    
}
@end
