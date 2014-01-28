//
//  PNDACardFanLayout.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDACardFanLayout.h"
#import "FanCardCollectionLayoutHelper.h"

@implementation PNDACardFanLayout
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    
    if (self.collectionView.numberOfSections < 1) {
        return array;
    }
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    FanCardCollectionLayoutHelper *fan = [FanCardCollectionLayoutHelper layout];
    CGRect bounds = self.collectionView.bounds;
    for (NSInteger row = 0; row < (numberOfItems / 6) + 1; ++row) {
        fan.position = CGPointMake(CGRectGetMidX(bounds), 140 + 180 * row);
        for (NSInteger idx = row * 6; idx < numberOfItems && idx < (row + 1) * 6; ++idx) {
            
            [array addObject:[fan layoutAttributesForCardAtIndexPath:[NSIndexPath indexPathForItem:idx inSection:0] cardN:idx % 6 ofNTotalCards:6 withScaleFactor:1.0]];
        }
    }
    
    return array;
}

- (CGSize)collectionViewContentSize
{
    return self.collectionView.bounds.size;
}

@end
