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
    bIsPlaceholderShown = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldTextDidChange)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self];
    
    placeholderLabel = [UILabel new];
    placeholderLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    placeholderLabel.text = self.placeholder;
    placeholderLabel.font = [UIFont fontWithName:self.font.fontName size:self.font.pointSize / 2];
    placeholderLabel.alpha = 0.0f;
    [self addSubview:placeholderLabel];
    [self bringSubviewToFront:placeholderLabel];
}

#pragma mark - TextField

- (void)textFieldTextDidChange {
    self.text.length > 0 ? [self showPlaceholder] : [self hidePlaceholder];
}

#pragma mark - Placeholder Work

- (void)showPlaceholder
{
    if (bIsPlaceholderShown)
        return;
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         placeholderLabel.frame = CGRectMake(placeholderLabel.frame.origin.x, -self.font.pointSize,
                                                             placeholderLabel.frame.size.width, placeholderLabel.frame.size.height);
                         placeholderLabel.alpha = 1.0f;
                     } completion:^(BOOL completed) {
                         bIsPlaceholderShown = YES;
                     }];
}

- (void)hidePlaceholder
{
    if (!bIsPlaceholderShown)
        return;
    
    [UIView animateWithDuration:0.1f
                     animations:^{
                         placeholderLabel.frame = CGRectMake(placeholderLabel.frame.origin.x, 0,
                                                             placeholderLabel.frame.size.width, placeholderLabel.frame.size.height);
                         placeholderLabel.alpha = 0.0f;
                     } completion:^(BOOL completeted) {
                         bIsPlaceholderShown = NO;
                     }];
}

#pragma mark - Customization

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    placeholderLabel.textColor = placeholderColor;
}

@end
