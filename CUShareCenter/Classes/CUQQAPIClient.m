//
//  CUQQAPIClient.m
//  Example
//
//  Created by curer on 13-10-28.
//  Copyright (c) 2013年 curer. All rights reserved.
//

#import "CUQQAPIClient.h"

static NSString * const baseURLString = @"https://graph.qq.com/";

@implementation CUQQAPIClient

+ (AFHTTPRequestOperationManager *)shareObjectManager
{
    static dispatch_once_t pred = 0;
    __strong static AFHTTPRequestOperationManager *_sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
        [CUQQAPIClient setup:_sharedObject];
    });
    
    return _sharedObject;
}

+ (void)setup:(AFHTTPRequestOperationManager *)objectManager
{
    
}

+ (AFHTTPRequestOperation *)userInfoWithOAuth:(TencentOAuth *)oAuth
                                      success:(void (^)(id json))success
                                        error:(void (^)(NSString *errorMsg))errorBlock;
{
    NSURLRequest *request =
    [[CUQQAPIClient shareObjectManager].requestSerializer requestWithMethod:@"GET"
                                                                  URLString:[[NSURL URLWithString:@"user/get_user_info"
                                                                                    relativeToURL:[NSURL URLWithString:baseURLString]]
                                                                             absoluteString]
                                                                 parameters:@{
                                                                              @"access_token" : oAuth.accessToken,
                                                                              @"openid" : oAuth.openId,
                                                                              @"oauth_consumer_key" : oAuth.appId,
                                                                              @"format" : @"json"
                                                                              }
                                                                      error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            errorBlock([error localizedDescription]);
        } else {
            success(json);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error localizedDescription]);
    }];
    return op;
}

+ (AFHTTPRequestOperation *)postContent:(NSString *)content
                                  OAuth:(TencentOAuth *)oAuth
                                success:(void (^)(id json))success
                                  error:(void (^)(NSString *errorMsg))errorBlock
{
    NSURLRequest *request =
    [[CUQQAPIClient shareObjectManager].requestSerializer requestWithMethod:@"POST"
                                                                  URLString:[[NSURL URLWithString:@"t/add_t"
                                                                                    relativeToURL:[NSURL URLWithString:baseURLString]]
                                                                             absoluteString]
                                                                 parameters:@{
                                                                              @"access_token" : oAuth.accessToken,
                                                                              @"openid" : oAuth.openId,
                                                                              @"oauth_consumer_key" : oAuth.appId,
                                                                              @"format" : @"json"
                                                                              }
                                                                      error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            errorBlock([error localizedDescription]);
        } else {
            success(json);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error localizedDescription]);
    }];
    return op;
}

+ (AFHTTPRequestOperation *)postContent:(NSString *)content
                      ImageData:(NSData *)imageData
                          OAuth:(TencentOAuth *)oAuth
                        success:(void (^)(id json))success
                          error:(void (^)(NSString *errorMsg))errorBlock
{
    NSURLRequest *request =
    [[CUQQAPIClient shareObjectManager].requestSerializer multipartFormRequestWithMethod:@"POST"
                                                                               URLString:[[NSURL URLWithString:@"t/add_pic_t"
                                                                                                 relativeToURL:[NSURL URLWithString:baseURLString]]
                                                                                          absoluteString]
                                                                              parameters:@{
                                                                                           @"access_token" : oAuth.accessToken,
                                                                                           @"openid" : oAuth.openId,
                                                                                           @"oauth_consumer_key" : oAuth.appId,
                                                                                           @"format" : @"json"
                                                                                           }
                                                               constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                                   [formData appendPartWithFileData:imageData
                                                                                               name:@"content"
                                                                                           fileName:@"image.jpg"
                                                                                           mimeType:@"image/jpeg"];
                                                               }
                                                                                   error:nil];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        id json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            errorBlock([error localizedDescription]);
        } else {
            success(json);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorBlock([error localizedDescription]);
    }];
    return op;
}

@end
