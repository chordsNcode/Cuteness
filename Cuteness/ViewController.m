//
//  ViewController.m
//  Cuteness
//
//  Created by Matt Dias on 7/18/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "ViewController.h"
#import "PostService.h"
#import "RedditPost.h"
#import "PostCollectionViewCell.h"

#import <AFNetworking/AFNetworking.h>


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UILabel *endLabel;
@property (nonatomic, strong) UICollectionView *postCollectionView;
@property (nonatomic, strong) NSArray *allPosts;
@property (nonatomic, strong) NSMutableArray *postsWithImages;


@end


@implementation ViewController

static NSString * identifier = @"postCell";

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(300, 327)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.postCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.postCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.postCollectionView.backgroundColor = [UIColor clearColor];
    self.postCollectionView.delegate = self;
    self.postCollectionView.dataSource = self;
    [self.postCollectionView registerClass:[PostCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:_postCollectionView];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[_postCollectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_postCollectionView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_postCollectionView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_postCollectionView)]];
}

- (void)viewWillAppear:(BOOL)animated {
    dispatch_async(dispatch_get_main_queue(), ^{
        [PostService getSubredditDataForSubreddit:@"aww" withCompletion:^(NSArray *posts, NSError *error) {
            if (!error) {
                self.allPosts = [MTLJSONAdapter modelsOfClass:[RedditPost class] fromJSONArray:posts error:NULL];
                self.postsWithImages = [NSMutableArray new];
                for (RedditPost *post in self.allPosts) {
                                // Pull out only posts with images (not self posts or albums)
                    if ([post.imageUrl rangeOfString:@".png"].location != NSNotFound ||
                        [post.imageUrl rangeOfString:@".jpg"].location != NSNotFound ||
                        [post.imageUrl rangeOfString:@".gif"].location != NSNotFound) {
                        
                        [self.postsWithImages addObject:post];
                    }
                }
                [self.postCollectionView reloadData];
            }
        }];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark - UICollectionView Delegate & Datasource Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;       // I want this one vertical column
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.postsWithImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.polaroidPicture.image = [UIImage new]; // this line makes it so previous isn't presented while waiting for the networking call.
    
    RedditPost *post = self.postsWithImages[indexPath.row];
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:post.imageUrl]]];
    requestOperation.responseSerializer = [AFImageResponseSerializer serializer];
    
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        cell.polaroidPicture.image = responseObject;
        
        cell.polaroidPicture.alpha = 0.0f;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.5f];
        cell.polaroidPicture.alpha = 1.0f;
        [UIView commitAnimations];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Image error: %@", error);
    }];
    [requestOperation start];
    
    return cell;
}


@end
