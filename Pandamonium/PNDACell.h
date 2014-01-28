//
//  PNDACell.h
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PNDACellViewModel;

@interface PNDACell : UICollectionViewCell
@property (nonatomic) PNDACellViewModel *viewModel;
@end
