//
//  PNDATodoViewModel.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDATodoViewModel.h"
#import "PNDACellViewModel.h"

@implementation PNDATodoViewModel
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
    
    RACSignal *viewModelsSignal = [[[CKIClient currentClient] fetchTodoItemsForCurrentUser] map:^id(NSArray *todoItems) {
        
        if (!hasResetTheCollectionControllerOnce) {
            [self.collectionController removeAllObjectsAndGroups];
            hasResetTheCollectionControllerOnce = YES;
        }
        
        NSArray *viewModels = [[[todoItems.rac_sequence filter:^BOOL(CKITodoItem *todoItem) {
            return [[todoItem.assignment.name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0;
        }] map:^id(CKITodoItem *todoItem) {
            return [PNDACellViewModel viewModelWithTitle:todoItem.assignment.name subtitle:todoItem.contextType];
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
