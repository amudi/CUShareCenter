//
//  SinaAPIClient.m
//  Example
//
//  Created by curer on 13-10-25.
//  Copyright (c) 2013年 curer. All rights reserved.
//

#import "CUSinaAPIClient.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@implementation CUSinaAPIClient

+ (AFHTTPRequestOperationManager *)shareObjectManager
{
    static dispatch_once_t pred = 0;
    __strong static AFHTTPRequestOperationManager *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[CUSinaAPIClient baseURL]];
        [CUSinaAPIClient setup:_sharedObject];
    });
    
    return _sharedObject;
}

+ (void)setup:(AFHTTPRequestOperationManager *)objectManager
{
    
}

+ (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://api.weibo.com/"];
}

@end
