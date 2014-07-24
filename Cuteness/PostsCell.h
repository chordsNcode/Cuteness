//
//  PostsCell.h
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *postImage;
@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *postUserName;
@property (nonatomic, strong) NSString *postUrl;

@end
