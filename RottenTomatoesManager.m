//
//  RottenTomatoesManager.m
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "RottenTomatoesManager.h"
#import "MoviesBuilder.h"
#import "RottenTomatoesCommunicator.h"

@implementation RottenTomatoesManager

-(void)fetchMovies {
    [_communicator listMovies];
}

-(void)receivedMoviesJSON:(NSData *)objectNotation {
    NSError *error = nil;
    
    NSArray *movies = [MoviesBuilder moviesFromJSON:objectNotation error:&error];
    [self.delegate didReceieveMovies:movies];
    
}

-(void)fetchingMoviesFailedWithError:(NSError *)error {
    [self.delegate fetchingMoviesFailedWithError:error];
}

@end
