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

@interface PNDACellViewModel () <MLVCCollectionViewCellViewModel, MLVCTableViewCellViewModel>
@end

@implementation PNDACellViewModel
+ (instancetype)viewModelWithTitle:(NSString *)title subtitle:(NSString *)subtitle
{
    PNDACellViewModel *cellVM = [self new];
    cellVM.title = title;
    cellVM.subtitle = subtitle;
    return cellVM;
}

#pragma mark - collection view

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


#pragma mark - table view

- (UITableViewCell *)tableViewController:(MLVCTableViewController *)controller cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [controller.tableView dequeueReusableCellWithIdentifier:@"PNDACell"];
    cell.textLabel.text = self.title;
    cell.detailTextLabel.text = self.subtitle;
    return cell;
}

@end
