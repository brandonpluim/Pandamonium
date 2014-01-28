//
//  DHFanCollectionLayout.m
//  DHCards
//
//  Created by Derrick Hathaway on 7/25/12.
//  Copyright (c) 2012 Derrick J. Hathaway. All rights reserved.
//

#import "FanCardCollectionLayoutHelper.h"

#define kCardMinAngle M_PI/16.f
#define kCardFanRadius 800


@implementation FanCardCollectionLayoutHelper

- (UICollectionViewLayoutAttributes *)layoutAttributesForCardAtIndexPath:(NSIndexPath *)indexPath cardN:(NSInteger)index ofNTotalCards:(NSInteger)n withScaleFactor:(CGFloat)scaleFactor
{
  NSInteger indexInCollection = index;
  CGFloat totalAngle = kCardMinAngle * (n-1);
  CGFloat thisAngle = -totalAngle/2.f + indexInCollection * kCardMinAngle;
  
  CGSize cardSize = CGSizeMake(216, 216);
  
  UICollectionViewLayoutAttributes *cardLayout = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
  cardLayout.frame = CGRectMake(0.f, 0.f, cardSize.width, cardSize.height);
  CGPoint offsetPoint = CGPointMake(self.position.x, self.position.y + kCardFanRadius * scaleFactor);
  cardLayout.center = CGPointMake(offsetPoint.x + kCardFanRadius * sinf(thisAngle) * scaleFactor, offsetPoint.y - kCardFanRadius * cosf(thisAngle) * scaleFactor);
  CATransform3D tx = CATransform3DIdentity;
  tx = CATransform3DScale(tx, scaleFactor, scaleFactor, scaleFactor);
  tx = CATransform3DRotate(tx, thisAngle, 0.f, 0.f, 1.f);
  cardLayout.transform3D = tx;
    cardLayout.zIndex = indexPath.item;
  
  return cardLayout;
}

@end
