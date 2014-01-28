//
//  PNDACellViewModel.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDACellViewModel.h"
#import "PNDACell.h"
#import <MyLittleViewController/MyLittleViewController.h>

@interface PNDACellViewModel () <MLVCCollectionViewCellViewModel>
@end

@implementation PNDACellViewModel
+ (instancetype)viewModelWithTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    PNDACellViewModel *cellVM = [self new];
    cellVM.title = title;
    cellVM.subtitle = subtitle;
    return cellVM;
}


- (UICollectionViewCell *)collectionViewController:(MLVCCollectionViewController *)controller cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PNDACell *cell = [controller.collectionView dequeueReusableCellWithReuseIdentifier:@"PNDACell" forIndexPath:indexPath];
    cell.viewModel = self;
    return cell;
}

- (void)collectionViewController:(MLVCCollectionViewController *)controller didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // do nothing
}

@end
