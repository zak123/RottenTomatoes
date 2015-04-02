//
//  DetailViewController.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movies.h"

@interface DetailViewController : UIViewController


@property (strong, nonatomic) Movies *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *moviePoster;
@property (strong, nonatomic) IBOutlet UILabel *movieTitleLabel;

@end

