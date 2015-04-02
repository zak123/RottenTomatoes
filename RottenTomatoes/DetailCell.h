//
//  DetailCell.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *movieSynposisLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@end
