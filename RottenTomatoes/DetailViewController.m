//
//  DetailViewController.m
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        self.title = self.detailItem.title;
        self.detailDescriptionLabel.text = self.detailItem.synposis;
        
        NSURL *imageURL = [NSURL URLWithString:self.detailItem.poster];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        self.moviePoster.image = [UIImage imageWithData:imageData];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
