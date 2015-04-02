//
//  RottenTomatoesCommunicator.m
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "RottenTomatoesCommunicator.h"
#import "RottenTomatoesCommunicatorDelegate.h"

#define API_KEY @"aRNY7R61fgpsobkeybrdMRkYywRTJPUF"

@implementation RottenTomatoesCommunicator

-(void) listMovies {
    NSString *apiURLString = [NSString stringWithFormat:@"https://www.kimonolabs.com/api/b556wofw?apikey=%@", API_KEY];
    
    NSURL *url = [[NSURL alloc] initWithString:apiURLString];
    NSLog(@"%@", apiURLString);
    
        [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        if (error) {
            [self.delegate fetchingMoviesFailedWithError:error];
        }
        
        else {
            [self.delegate receivedMoviesJSON:data];
        }
        //if error
        
    }];
}




@end
