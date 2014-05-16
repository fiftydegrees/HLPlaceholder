//
//  HLTextField.m
//  HLPlaceholderSample
//
//  Created by Hervé Droit on 16/05/2014.
//  Copyright (c) 2014 Hervé Heurtault de Lammerville. All rights reserved.
//

#import "HLPlaceholder.h"

@implementation HLPlaceholder

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    [self initPlaceholder];
}

#pragma mark - Placeholder Creation

- (void)initPlaceholder
{
    bIsPlaceholderShown = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldTextDidChange)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
    placeholderLabel = [UILabel new];
    placeholderLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    placeholderLabel.text = self.placeholder;
    placeholderLabel.font = self.font;
}

#pragma mark - TextField

- (void)textFieldTextDidChange {
    NSLog(@"T: %@", self.text);
    if (self.text.length > 0)
        [self hidePlaceholder];
    else if (self.text.length == 0)
        [self showPlaceholder];
}

#pragma mark - Placeholder Work

- (void)showPlaceholder
{
    if (bIsPlaceholderShown)
        return;
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         placeholderLabel.frame = CGRectMake(placeholderLabel.frame.origin.x, 0,
                                                             placeholderLabel.frame.size.width, placeholderLabel.frame.size.height);
                         placeholderLabel.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize];
                     } completion:^(BOOL completed) {
                         self.placeholder = placeholderLabel.text;
                         [placeholderLabel removeFromSuperview];
                         bIsPlaceholderShown = YES;
                     }];
}

- (void)hidePlaceholder
{
    if (!bIsPlaceholderShown)
        return;
    
    placeholderLabel.textColor = self.placeholderColor;
    self.placeholder = @"";
    
    [self addSubview:placeholderLabel];
    [self bringSubviewToFront:placeholderLabel];
    [UIView animateWithDuration:0.1f
                     animations:^{
                         placeholderLabel.frame = CGRectMake(placeholderLabel.frame.origin.x, -self.frame.size.height / 2 + 10,
                                                             placeholderLabel.frame.size.width, placeholderLabel.frame.size.height);
                         placeholderLabel.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize / 2];
                     } completion:^(BOOL completeted) {
                         bIsPlaceholderShown = NO;
                     }];
}

@end
