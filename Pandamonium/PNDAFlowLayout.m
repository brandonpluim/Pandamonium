//
//  PNDAFlowLayout.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDAFlowLayout.h"

@implementation PNDAFlowLayout

- (void)awakeFromNib
{
    self.itemSize = CGSizeMake(216, 218);
    self.minimumInteritemSpacing = 20;
    self.minimumLineSpacing = 20;
    self.sectionInset = UIEdgeInsetsMake(100, 156, 100, 156);
}

@end
