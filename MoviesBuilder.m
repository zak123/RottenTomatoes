//
//  MoviesBuilder.m
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "Movies.h"
#import "MoviesBuilder.h"

@implementation MoviesBuilder

+ (NSArray *)moviesFromJSON:(NSData *)objectNotation error:(NSError **)error {
    
    NSError *parseError = nil;
    
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&parseError];
    
    if (parseError != nil) {
        *error = parseError;
        return nil;
    }
    
    NSMutableArray *movies = [[NSMutableArray alloc]init];
    
    NSArray *results = dataDictionary[@"results"][@"collection1"];
    
    
    NSLog(@"%lu", (unsigned long)results.count);
    
    for (NSDictionary *movieDic in results) {
        Movies *movie = [[Movies alloc]init];
        
        movie.title = movieDic[@"title"];
        movie.synposis = movieDic[@"synopsis"][@"text"];
        movie.poster = movieDic[@"poster"][@"src"];
        movie.score = movieDic[@"score"];
        
        
        
        [movies addObject:movie];
    }
    
    return movies;
}
@end
