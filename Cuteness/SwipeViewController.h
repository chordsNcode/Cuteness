//
//  SwipeViewController.h
//  Cuteness
//
//  Created by Matt Dias on 7/29/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedditPost.h"
#import "PostView.h"
#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

@interface SwipeViewController : UIViewController <MDCSwipeToChooseDelegate>

@property (nonatomic, strong) RedditPost *currentPost;

/***
    These are the views representing the individual post "polaroids"
 ***/
@property (nonatomic, strong) PostView *topPost;
@property (nonatomic, strong) PostView *secondPost;
@property (nonatomic, strong) PostView *thirdPost;


@end
