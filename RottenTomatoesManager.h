//
//  RottenTomatoesManager.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RottenTomatoesManagerDelegate.h"
#import "RottenTomatoesCommunicatorDelegate.h"


@class RottenTomatoesCommunicator;


@interface RottenTomatoesManager : NSObject<RottenTomatoesCommunicatorDelegate>

@property (strong, nonatomic) RottenTomatoesCommunicator *communicator;
@property (weak, nonatomic) id<RottenTomatoesManagerDelegate> delegate;


-(void)fetchMovies;

@end
