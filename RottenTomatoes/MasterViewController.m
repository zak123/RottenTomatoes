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
        [self.tableView reloadData];
    });
}

- (void)fetchingMoviesFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Movies *movie = _movies[indexPath.row];
    [cell.movieNameLabel setText:movie.title];
    [cell.movieSynposisLabel setText:movie.synposis];
    [cell.scoreLabel setText:movie.score];
//    [cell.movieRatingLabel setText:movie.mpaa_rating];
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Movies *selectedMovie = _movies[indexPath.row];
        detailVC.detailItem = selectedMovie;
        
        
    }
}

@end
