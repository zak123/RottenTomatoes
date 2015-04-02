//
//  WebViewController.h
//  RottenTomatoes
//
//  Created by Zachary Mallicoat on 4/1/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *WebView;
@property (strong, nonatomic) NSString *urlstr;
@property (strong, nonatomic) NSString *viewTitle;

@end
