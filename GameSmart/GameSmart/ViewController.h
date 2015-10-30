//
//  ViewController.h
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *gameSmartLogo;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *logoLoading;

@end
