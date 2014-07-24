//
//  PostService.h
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostService : NSObject

+ (void)getSubredditDataForSubreddit: (NSString *)subReddit withCompletion:(void (^)(NSArray *posts, NSError *error))completion;
+ (void)getRedditPostImageForUrl: (NSString *)imageUrl withCompletion:(void (^)(UIImage *postImage, NSError *error))completion;

@end
