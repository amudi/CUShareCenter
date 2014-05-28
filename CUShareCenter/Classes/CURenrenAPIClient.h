//
//  CURenrenAPIClient.h
//  Example
//
//  Created by curer on 13-10-30.
//  Copyright (c) 2013年 curer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface CURenrenAPIClient : NSObject

+ (AFHTTPRequestOperationManager *)shareObjectManager;
+ (NSURL *)baseURL;

@end
