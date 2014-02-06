//
//  PNDACell.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDACell.h"
#import "PNDACellViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface PNDACell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@end

typedef double Double;

@implementation PNDACell

- (void)awakeFromNib
{
    RAC(self, titleLabel.text) = RACObserve(self, viewModel.title);
    RAC(self, subtitleLabel.text) = RACObserve(self, viewModel.subtitle);
    
    CALayer *border = [CALayer layer];
    border.borderWidth = 1.f/ [UIScreen mainScreen].scale;
    border.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    border.frame = CGRectInset(self.bounds, 0, 0);
    [self.layer insertSublayer:border atIndex:0];
}

@end
