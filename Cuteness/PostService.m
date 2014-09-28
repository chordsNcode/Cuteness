//
//  PostService.m
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "PostService.h"

#import <AFNetworking/AFNetworking.h>


@interface PostService()


#define urlContext "http://www.reddit.com/r/"


@end


@implementation PostService

+ (void)getSubredditDataForSubreddit:(NSString *)subReddit withCompletion:(void (^)(NSArray *posts, NSError *error))completion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:[NSString stringWithFormat:@"%s%@.json", urlContext, subReddit] parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSArray *posts = responseObject[@"data"][@"children"][@"data"];
        completion(posts, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
    
}

+ (void)getRedditPostImageForUrl:(NSString *)imageUrl withCompletion:(void (^)(UIImage *postImage, NSError *error))completion {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:imageUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}


@end
