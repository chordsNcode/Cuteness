//
//  PostCollectionViewCell.m
//  Cuteness
//
//  Created by Matt Dias on 9/27/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "PostCollectionViewCell.h"


@implementation PostCollectionViewCell


- (void)layoutSubviews {
    // cell 300x327 (@1x)
    // image 260x240
    // images starts 21x21
    self.backgroundColor = [UIColor whiteColor];
    
    self.polaroidPicture = [UIImageView new];
    self.polaroidPicture.translatesAutoresizingMaskIntoConstraints = NO;
    self.polaroidPicture.backgroundColor = [UIColor blackColor];
    self.polaroidPicture.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_polaroidPicture];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-21-[_polaroidPicture]-21-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_polaroidPicture)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-21-[_polaroidPicture(240)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_polaroidPicture)]];
 
    [super layoutSubviews];
}


@end
