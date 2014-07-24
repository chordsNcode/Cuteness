//
//  PostUnmarshaller.m
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "PostUnmarshaller.h"
#import "RedditPost.h"

@implementation PostUnmarshaller

+ (NSArray *)unmarshalPostsForDictionary: (NSDictionary *)responseDictionary {
    NSMutableArray *returnedPosts = [[NSMutableArray alloc] init];
    NSArray *posts = responseDictionary[@"data"][@"children"];
    RedditPost *rPost = [RedditPost new];
    
    for (NSDictionary *post in posts) {
        rPost.imageUrl = post[@"url"];
        rPost.postUrl = post[@"permalink"];
        rPost.author = post[@"author"];
        rPost.title = post[@"title"];
        
        [returnedPosts addObject:rPost];
    }
    
    return returnedPosts;
}

@end
