//
//  HLTextField.h
//  HLPlaceholderSample
//
//  Created by Hervé Droit on 16/05/2014.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLPlaceholder : UITextField
{
    BOOL bIsPlaceholderShown;
    UILabel *placeholderLabel;
}

@property (nonatomic, strong) UIColor *placeholderColor;

@end
