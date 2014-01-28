//
//  PNDACellViewModel.h
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PNDACellViewModel : NSObject
+ (instancetype)viewModelWithTitle:(NSString *)title subtitle:(NSString *)subtitle;

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *subtitle;
@end
