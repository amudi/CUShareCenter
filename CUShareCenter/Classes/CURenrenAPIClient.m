//
//  CURenrenAPIClient.m
//  Example
//
//  Created by curer on 13-10-30.
//  Copyright (c) 2013年 curer. All rights reserved.
//

#import "CURenrenAPIClient.h"

@implementation CURenrenAPIClient

+ (AFHTTPRequestOperationManager *)shareObjectManager
{
    static dispatch_once_t pred = 0;
    __strong static AFHTTPRequestOperationManager *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[CURenrenAPIClient baseURL]];
        [CURenrenAPIClient setup:_sharedObject];
    });
    
    return _sharedObject;
}

+ (void)setup:(AFHTTPRequestOperationManager *)objectManager
{
    
}

+ (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://api.renren.com/"];
}

@end
