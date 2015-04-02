//
//  MoviesBuilder.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoviesBuilder : NSObject

+ (NSArray *)moviesFromJSON:(NSData *)objectNotation error:(NSError **)error;


@end
