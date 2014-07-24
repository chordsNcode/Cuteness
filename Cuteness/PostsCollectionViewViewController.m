//
//  PostsCollectionViewViewController.m
//  Cuteness
//
//  Created by Matt Dias on 7/20/14.
//  Copyright (c) 2014 saiDttaM. All rights reserved.
//

#import "PostsCollectionViewViewController.h"
#import "PostsCell.h"
#import "PostService.h"
#import "RedditPost.h"

@interface PostsCollectionViewViewController ()

@property (nonatomic, strong) NSArray *posts;

@end

@implementation PostsCollectionViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [PostService getSubredditDataForSubreddit:@"Aww" withCompletion:^(NSArray *posts, NSError *error) {
            if (error) {
                        // TODO: make this more professional
                UIAlertView *networkAlert = [[UIAlertView alloc] initWithTitle:@"Data retrieval error"
                                                                       message:@"There was a problem getting the cuteness"
                                                                      delegate:self
                                                             cancelButtonTitle:@"Darn"
                                                             otherButtonTitles:nil, nil];
                [networkAlert show];
            } else {
                self.posts = posts;
            }
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PostsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PostCell" forIndexPath:indexPath];
    RedditPost *post = self.posts[indexPath.row];
    
    [PostService getRedditPostImageForUrl:post.imageUrl withCompletion:^(UIImage *postImage, NSError *error) {
        cell.postTitle = post.title;
        cell.postImage.image = postImage;
        cell.postUserName = post.author;
        cell.postUrl = post.postUrl;
    }];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
