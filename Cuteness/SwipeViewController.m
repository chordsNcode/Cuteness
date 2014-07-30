//
//  SwipeViewController.m
//  Cuteness
//
//  Created by Matt Dias on 7/29/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "SwipeViewController.h"
#import "PostService.h"


@interface SwipeViewController ()

@property (nonatomic, strong) NSMutableArray *posts;

@end

@implementation SwipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [PostService getSubredditDataForSubreddit:@"Aww" withCompletion:^(NSArray *posts, NSError *error) {
            if (!error) {
                self.posts = posts;
            }
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Display the first ChoosePersonView in front. Users can swipe to indicate
    // whether they like or dislike the person displayed.
    self.topPost = [self popPersonViewWithFrame:[self frontCardViewFrame]];
    [self.view addSubview:self.topPost];
    
    // Display the second ChoosePersonView in back. This view controller uses
    // the MDCSwipeToChooseDelegate protocol methods to update the front and
    // back views after each user swipe.
    self.secondPost = [self popPersonViewWithFrame:[self backCardViewFrame]];
    [self.view insertSubview:self.secondPost belowSubview:self.topPost];
    self.thirdPost = [self popPersonViewWithFrame:[self backCardViewFrame]];
    [self.view insertSubview:self.thirdPost aboveSubview:self.secondPost];
    
    // Add buttons to programmatically swipe the view left or right.
    // See the `nopeFrontCardView` and `likeFrontCardView` methods.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PostView *)popPersonViewWithFrame:(CGRect)frame {
    if (self.posts.count == 0) {
        return nil;
    }
    
    // UIView+MDCSwipeToChoose and MDCSwipeToChooseView are heavily customizable.
    // Each take an "options" argument. Here, we specify the view controller as
    // a delegate, and provide a custom callback that moves the back card view
    // based on how far the user has panned the front card view.
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.threshold = 160.f;
    options.onPan = ^(MDCPanState *state){
        CGRect frame = [self backCardViewFrame];
        self.secondPost.frame = CGRectMake(frame.origin.x,
                                             frame.origin.y - (state.thresholdRatio * 10.f),
                                             CGRectGetWidth(frame),
                                             CGRectGetHeight(frame));
    };
    
    // Create a personView with the top person in the people array, then pop
    // that person off the stack.
    PostView *postView = [[PostView alloc] initWithFrame:frame
                                                    post:self.posts[0]
                                                 options:options];
    [self.posts removeObjectAtIndex:0];
    return postView;
}

#pragma mark View Contruction

- (CGRect)frontCardViewFrame {
    CGFloat horizontalPadding = 20.f;
    CGFloat topPadding = 60.f;
    CGFloat bottomPadding = 200.f;
    return CGRectMake(horizontalPadding,
                      topPadding,
                      CGRectGetWidth(self.view.frame) - (horizontalPadding * 2),
                      CGRectGetHeight(self.view.frame) - bottomPadding);
}

- (CGRect)backCardViewFrame {
    CGRect frontFrame = [self frontCardViewFrame];
    return CGRectMake(frontFrame.origin.x,
                      frontFrame.origin.y + 10.f,
                      CGRectGetWidth(frontFrame),
                      CGRectGetHeight(frontFrame));
}

@end
