//
//  ViewController.m
//  HLPlaceholderSample
//
//  Created by Hervé Droit on 16/05/2014.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

#import "ViewController.h"

#import "HLPlaceholder.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet HLPlaceholder *sampleTextField;
@end

@implementation ViewController

#pragma mark - ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sampleTextField.placeholderColor = [UIColor orangeColor];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

#pragma mark - System

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
