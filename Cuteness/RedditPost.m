//
//  RedditPost.m
//  Cuteness
//
//  Created by Matt Dias on 7/23/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "RedditPost.h"


@implementation RedditPost

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"imageUrl" : @"data.url",
             @"postUrl" : @"data.permalink",
             @"author" : @"data.author",
             @"title" : @"data.title"
             };
}


@end
