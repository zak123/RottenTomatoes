//
//  MasterViewController.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DetailViewController.h"
#import "DetailCell.h"
#import "Movies.h"
#import "RottenTomatoesManager.h"
#import "RottenTomatoesCommunicator.h"

@interface MasterViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@end

