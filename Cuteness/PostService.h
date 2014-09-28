//
//  PostService.h
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PostService : NSObject


/**
 *  Makes an AFNetworking call to retreive JSON object for supplied subreddit.
 *
 *  @param subReddit  Subreddit name (url path after /r/)
 *  @param completion Array of post data
 */
+ (void)getSubredditDataForSubreddit:(NSString *)subReddit withCompletion:(void (^)(NSArray *posts, NSError *error))completion;

/**
 *  Download the image for a specific reddit post.
 *
 *  @param imageUrl   URL, in string form, of a single post's imageUrl
 *  @param completion The image
 */
+ (void)getRedditPostImageForUrl:(NSString *)imageUrl withCompletion:(void (^)(UIImage *postImage, NSError *error))completion;


@end
