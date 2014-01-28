//
//  PNDAAssignmentsViewModel.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "PNDAAssignmentsViewModel.h"
#import "PNDACellViewModel.h"

@interface PNDAAssignmentsViewModel ()
@property (nonatomic) CKIClient *client;
@end

@implementation PNDAAssignmentsViewModel
@synthesize collectionController;

- (void)awakeFromNib
{
    self.collectionController = [MLVCCollectionController collectionControllerGroupingByBlock:nil groupTitleBlock:nil sortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]];
}

- (RACSignal *)refreshViewModelSignalForced:(BOOL)forced
{
    __block BOOL hasResetTheCollectionControllerOnce = NO;
    
    RACSignal *viewModelsSignal = [[[CKIClient currentClient] fetchAssignmentsForCourse:[CKICourse modelWithID:@"25951"]] map:^id(NSArray *assignments) {
        
        if (!hasResetTheCollectionControllerOnce) {
            [self.collectionController removeAllObjectsAndGroups];
            hasResetTheCollectionControllerOnce = YES;
        }
        
        NSArray *viewModels = [[assignments.rac_sequence map:^id(CKIAssignment *assignment) {
            static NSDateFormatter *dateFormatter;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                dateFormatter = [NSDateFormatter new];
                dateFormatter.dateStyle = NSDateFormatterMediumStyle;
            });
            return [PNDACellViewModel viewModelWithTitle:assignment.name subtitle:[dateFormatter stringFromDate:assignment.dueAt]];
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
