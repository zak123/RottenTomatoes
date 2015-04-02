//
//  MasterViewController.m
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MasterViewController.h"
#define API_KEY @"25s9mcsj9js2y6xxfeq5tgfk"


@interface MasterViewController () <RottenTomatoesManagerDelegate> {
    NSArray *_movies;
    RottenTomatoesManager *_manager;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[RottenTomatoesManager alloc] init];
    _manager.communicator = [[RottenTomatoesCommunicator alloc] init];
    
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self startFetchingMovies];

    // main implementation
}


-(void)startFetchingMovies {
    [_manager fetchMovies];
}

#pragma mark - MeetupManagerDelegate
- (void)didReceieveMovies:(NSArray *)movies
{
    // make sure movies are loaded
    _movies = movies;
    
    // Update tableview after asynchronous task is done fetching data
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (void)fetchingMoviesFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    Movies *movie = _movies[indexPath.row];
//    [cell.movieNameLabel setText:movie.title];
//    [cell.movieSynposisLabel setText:movie.synposis];
//    [cell.scoreLabel setText:movie.score];
    
    
    NSURL *imageURL = [NSURL URLWithString:movie.poster];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    cell.movieImage.image = [UIImage imageWithData:imageData];
    
    return cell;
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        
        Movies *selectedMovie = _movies[indexPath.row];
        detailVC.detailItem = selectedMovie;
        
        
    }
}

@end
