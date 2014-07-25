//
//  HelpViewController.m
//  Dos
//
//  Created by Arman Aydemir on 7/25/14.
//  Copyright (c) 2014 Arman Aydemir. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    BOOL backgroundIsWhite = self.view.backgroundColor == [UIColor whiteColor];
    if (backgroundIsWhite == true){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

@end
