//
//  CKIClient+PNDAClient.m
//  Pandamonium
//
//  Created by derrick on 1/28/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import "CKIClient+PNDAClient.h"
#import <CanvasKit/CanvasKit.h>

@implementation CKIClient (PNDAClient)
+ (instancetype)currentClient
{
    static CKIClient *currentClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        currentClient = [CKIClient clientWithBaseURL:[NSURL URLWithString:@"https://canvas.instructure.com"] clientID:@"foo" clientSecret:@"bar" keychainServiceID:nil accessGroup:nil];
        NSString *accessToken = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"accesstoken" ofType:@"tkn"] encoding:NSUTF8StringEncoding error:NULL];
        [currentClient setValue:accessToken forKey:@"accessToken"];
        currentClient.currentUser = [CKIUser modelWithID:@"255173"];
    });
    return currentClient;
}
@end
