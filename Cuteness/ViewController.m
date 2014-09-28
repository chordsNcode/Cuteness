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


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UILabel *endLabel;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark - UICollectionView Delegate & Datasource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


@end
