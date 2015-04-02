//
//  Movies.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Movies : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synposis;
@property (nonatomic, strong) NSString *poster;
@property (nonatomic, strong) NSString *score;
@property (nonatomic, strong) UIImage *parsedImage;




@end
