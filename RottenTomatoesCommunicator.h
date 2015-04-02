//
//  RottenTomatoesCommunicator.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol RottenTomatoesCommunicatorDelegate;

@interface RottenTomatoesCommunicator : NSObject

@property (weak, nonatomic) id<RottenTomatoesCommunicatorDelegate> delegate;

-(void)listMovies;


@end