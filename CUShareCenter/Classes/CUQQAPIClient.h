//
//  CUQQAPIClient.h
//  Example
//
//  Created by curer on 13-10-28.
//  Copyright (c) 2013年 curer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <AFNetworking/AFHTTPRequestOperation.h>
#import <TencentOpenAPI/TencentOAuth.h>

@interface CUQQAPIClient : NSObject

+ (AFHTTPRequestOperationManager *)shareObjectManager;

+ (AFHTTPRequestOperation *)userInfoWithOAuth:(TencentOAuth *)oAuth
                              success:(void (^)(id json))success
                                error:(void (^)(NSString *errorMsg))errorBlock;

+ (AFHTTPRequestOperation *)postContent:(NSString *)content
                          OAuth:(TencentOAuth *)oAuth
                        success:(void (^)(id json))success
                          error:(void (^)(NSString *errorMsg))errorBlock;

+ (AFHTTPRequestOperation *)postContent:(NSString *)content
                      ImageData:(NSData *)imageData
                          OAuth:(TencentOAuth *)oAuth
                        success:(void (^)(id json))success
                          error:(void (^)(NSString *errorMsg))errorBlock;

@end
