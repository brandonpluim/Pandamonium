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

@implementation PNDACell

- (void)awakeFromNib
{
    RAC(self, titleLabel.text) = RACObserve(self, viewModel.title);
    RAC(self, subtitleLabel.text) = RACObserve(self, viewModel.subtitle);
}

@end
