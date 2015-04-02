//
//  RottenTomatoesCommunicatorDelegate.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RottenTomatoesCommunicatorDelegate

-(void) receivedMoviesJSON:(NSData*)objectNotation;
-(void) fetchingMoviesFailedWithError:(NSError *)error;

@end
