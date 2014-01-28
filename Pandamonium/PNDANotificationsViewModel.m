//
//  PNDANotificationsViewModel.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDANotificationsViewModel.h"
#import "PNDACellViewModel.h"

@implementation PNDANotificationsViewModel
@synthesize collectionController;

- (id)init
{
    self = [super init];
    if (self) {
        self.collectionController = [MLVCCollectionController collectionControllerGroupingByBlock:nil groupTitleBlock:nil sortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]];
    }
    return self;
}

- (RACSignal *)refreshViewModelSignalForced:(BOOL)forced
{
    __block BOOL hasResetTheCollectionControllerOnce = NO;
    
    RACSignal *viewModelsSignal = [[[CKIClient currentClient] fetchActivityStream] map:^id(NSArray *streamItems) {
        
        if (!hasResetTheCollectionControllerOnce) {
            [self.collectionController removeAllObjectsAndGroups];
            hasResetTheCollectionControllerOnce = YES;
        }
        
        NSArray *viewModels = [[[streamItems.rac_sequence filter:^BOOL(CKIActivityStreamItem *streamItem) {
            return [[streamItem.title stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0;
        }] map:^id(CKIActivityStreamItem *streamItem) {
            return [PNDACellViewModel viewModelWithTitle:streamItem.title subtitle:streamItem.message];
        }] array];
        
        return viewModels;
    }];
    
    
    [viewModelsSignal subscribeNext:^(NSArray *viewModels) {
        [self.collectionController insertObjects:viewModels];
    } error:^(NSError *error) {
        NSLog(@"something went wrong: %@", error);
    }];
    
    return viewModelsSignal;
}

@end
