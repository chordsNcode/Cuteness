//
//  PostUnmarshaller.h
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostUnmarshaller : NSObject

+ (NSArray *)unmarshalPostsForDictionary: (NSDictionary *)responseDictionary;

@end
