//
//  DHFanCollectionLayout.h
//  DHCards
//
//  Created by Derrick Hathaway on 7/25/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import "CardCollectionLayoutHelper.h"

@interface FanCardCollectionLayoutHelper : CardCollectionLayoutHelper
- (UICollectionViewLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)indexPath cardN:(NSInteger)index ofNTotalCards:(NSInteger)n withScaleFactor:(CGFloat)scaleFactor;
@end
