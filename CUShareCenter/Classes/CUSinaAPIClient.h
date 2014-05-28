//
//  SinaAPIClient.h
//  Example
//
//  Created by curer on 13-10-25.
//  Copyright (c) 2013年 curer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;
@interface CUSinaAPIClient : NSObject

+ (AFHTTPRequestOperationManager *)shareObjectManager;
+ (NSURL *)baseURL;

@end
