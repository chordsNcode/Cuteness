//
//  RedditPost.h
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>


@interface RedditPost : NSObject

@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *postUrl;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *title;


@end
